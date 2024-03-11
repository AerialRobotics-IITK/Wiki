# Jetson TX2 Setup

This guide demonstrates how to flash Jetson TX2 using Docker on Ubuntu 22.04. Docker provides a convenient environment for executing the NVIDIA SDK Manager tool without worrying about dependencies or system configurations.

#### Prerequisites

* Docker installed on the host PC
* Jetson TX2 development kit
* Internet connection

#### Steps

1. **Download Docker Image**
   * Download the Docker image from [NVIDIA SDK Manager](https://developer.nvidia.com/sdk-manager) to your host PC.
2. **Load Docker Image**
   * Navigate to the directory where the downloaded Docker image is located.
   *   Run the following command to load the Docker image:

       ```
       docker load -i ./sdkmanager-[version].[build#]-[base_OS]_docker.tar.gz
       ```

       Replace `[version].[build#]` and `[base_OS]` with the appropriate values. Press tab for autofill.
3. **Tag the Version (Optional)**
   *   It's recommended to tag the version as "latest" for ease of use:

       ```
       docker tag sdkmanager:[version].[build#] sdkmanager:latest
       ```
4.  **Flash Jetson TX2**

    *   Run the following command to initiate the flashing process

        ```
        docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb/ -v /dev:/dev -v /media/$USER:/media/nvidia:slave --name JetPack_TX2_Devkit --network host sdkmanager --cli --action install --login-type devzone --product Jetson --target-os Linux --version 4.6.4 --host --target JETSON_TX2_TARGETS --flash --license accept --stay-logged-in true --collect-usage-data enable --exit-on-finish
        ```

        This command initiates the SDK Manager in CLI mode and starts the flashing process.
    *   Once the installation and flashing are complete, commit the container as a new image:

        ```bash
        docker commit JetPack_TX2_Devkit jetpack_tx2_devkit:flash
        ```
    *   Remove the original container:

        ```bash
        docker container rm JetPack_TX2_Devkit
        ```
    *   Run the flash operation directly from the created image:

        ```bash
        docker run -it --rm --privileged -v /dev/bus/usb:/dev/bus/usb/ jetpack_tx2_devkit:flash
        ```

    PS: You can use the 1st command again without the --name tag\

5.  **Follow On-screen Instructions**

    * Choose the packages to be installed.
    * Ignore any low memory warnings and proceed.

    <figure><img src="../../../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>

    * Select either automatic or manual mode.
    * Choose automatic mode, follow the on-screen instructions to complete the flashing process.

    <figure><img src="../../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>
6. **Completion**
   * Once the flashing process is completed, your Jetson TX2 will be flashed and ready for use.

#### Additional Notes

* Make sure to connect the Jetson TX2 development kit to your host PC via USB during the flashing process.

With this Docker-based approach, flashing your Jetson TX2 becomes a seamless process, eliminating the hassle of managing dependencies and configurations.

Certainly! Below is a README file outlining the known issues and necessary steps to address them when installing JetPack SDK and DRIVE SDK using the SDK Manager Docker image:

***

## Known Issues and Workarounds for SDK Manager Docker Image

**Issue:**

When installing JetPack SDK using the SDK Manager Docker image, you may encounter the following error during installation from the File System and OS component:

```
dpkg: Exec format error
```

#### Workaround:

Before installing JetPack SDK, ensure that `qemu-user-static` and `binfmt-support` are installed on your host machine. Run the following command on your host machine:

```bash
sudo apt-get install qemu-user-static binfmt-support
sudo update-binfmts --enable
```

### DRIVE SDK Installation

#### Issue:

Flashing the target may fail during DRIVE SDK installation if ADB is running on the host machine.

#### Workaround:

Before flashing the target, make sure to stop ADB using the following command on your host machine:

```bash
sudo killall adb
```

### Additional Notes:

* These known issues and workarounds are provided to assist with a smoother installation process.
* Ensure to follow the instructions carefully to avoid encountering the mentioned issues.

***



Instructions for manual mode will be updated soon. Please refer to the documentation at [NVIDIA SDK Manager Docker Containers](https://docs.nvidia.com/sdk-manager/docker-containers/index.html) for further Reference.
