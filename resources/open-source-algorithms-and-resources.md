---
description: >-
  List of open-source algorithms and resources for autonomous drones. The list
  is a work in progress!
---

# Open-source algorithms and resources

### Perception

| Link                                                                   | Who                               | Description                                                                                                          | ROS                  |
| ---------------------------------------------------------------------- | --------------------------------- | -------------------------------------------------------------------------------------------------------------------- | -------------------- |
| [visual-slam-roadmap](https://github.com/changh95/visual-slam-roadmap) |                                   | Great Roadmap for Visual SLAM                                                                                        |                      |
| [voxblox](https://github.com/ethz-asl/voxblox)                         | ETH                               | voxel-based mapping                                                                                                  | :heavy\_check\_mark: |
| [maplab](https://github.com/ethz-asl/mav\_voxblox\_planning)           | ETH                               | visual inertial mapping                                                                                              | :heavy\_check\_mark: |
| [orb-slam2](https://github.com/raulmur/ORB\_SLAM2)                     |                                   | sparse 3D reconstruction                                                                                             | :heavy\_check\_mark: |
| [open\_vins](https://github.com/rpng/open\_vins)                       | U. of Delaware                    | EKF fuses inertial info with sparse visual features                                                                  | :heavy\_check\_mark: |
| [SVO 2.0](http://rpg.ifi.uzh.ch/svo2.html)                             | ETH                               | semi-direct paradigm to estimate pose from pixel intensities and features                                            | :heavy\_check\_mark: |
| [DSO](https://github.com/JakobEngel/dso/)                              | TUM                               | direct sparse odometry                                                                                               |                      |
| [XIVO](https://feixh.github.io/projects/xivo/)                         | UCLA                              | inertial-aided visual odometry                                                                                       |                      |
| [VINS-Fusion](https://github.com/HKUST-Aerial-Robotics/VINS-Fusion)    | HKUST                             | An optimization-based multi-sensor state estimator                                                                   |                      |
| [Kimera-VIO](https://github.com/MIT-SPARK/Kimera)                      | MIT                               | real-time metric-semantic SLAM and VIO                                                                               | :heavy\_check\_mark: |
| [tagSLAM](https://github.com/berndpfrommer/tagslam)                    | UPenn                             | tagSLAM with apriltags                                                                                               | :heavy\_check\_mark: |
| [LARVIO](https://github.com/PetWorm/LARVIO)                            |                                   | A lightweight, accurate and robust monocular visual inertial odometry based on Multi-State Constraint Kalman Filter. | :heavy\_check\_mark: |
| [R-VIO](https://github.com/rpng/R-VIO)                                 |                                   | based on robocentric sliding-window filtering-based VIO framework                                                    |                      |
| [nanomap](https://github.com/peteflorence/nanomap\_ros)                | MIT                               | fast, uncertainty-aware proximity queries with lazy search of local 3D data                                          |                      |
| [MSCKF\_VIO](https://github.com/KumarRobotics/msckf\_vio)              | UPenn                             | package is a stereo version of MSCKF                                                                                 |                      |
| [VINS\_mono](https://github.com/HKUST-Aerial-Robotics/VINS-Mono)       | HKUST                             | Robust and Versatile Monocular Visual-Inertial State Estimator                                                       |                      |
| [SLAM\_toolbox](https://github.com/SteveMacenski/slam\_toolbox)        | Simbe Robotics / Samsung Research | SLAM for massive maps                                                                                                | :heavy\_check\_mark: |

### Navigation

| Link                                                                                                             | Who                 | Description                                                                                       | ROS                  |
| ---------------------------------------------------------------------------------------------------------------- | ------------------- | ------------------------------------------------------------------------------------------------- | -------------------- |
| [mav\_trajectory\_generation](https://github.com/ethz-asl/mav\_trajectory\_generation)                           | ETH                 | creates polynomial path                                                                           | :heavy\_check\_mark: |
| [mav\_voxblox\_planning](https://github.com/ethz-asl/mav\_voxblox\_planning)                                     | ETH                 | planning tool using voxblox (RRT\*, etc.)                                                         | :heavy\_check\_mark: |
| [pulp-dronet](https://github.com/pulp-platform/pulp-dronet)                                                      | ETH                 | deep learning visual navigation                                                                   |                      |
| [Ewok: real-time traj replanning](https://github.com/VladyslavUsenko/ewok)                                       | TUM                 | replanning of global traj, needs prior map                                                        |                      |
| [Deep RL with Transfer Learning](https://github.com/aqeelanwar/DRLwithTL\_real)                                  | Georgia Tech        | end-to-end navigation trained from simulation                                                     |                      |
| [NVIDIA redtail project](https://github.com/NVIDIA-AI-IOT/redtail)                                               |                     | Autonomous navigation for drones                                                                  |                      |
| [Fast-Planner](https://github.com/HKUST-Aerial-Robotics/Fast-Planner)                                            | HKUST               | robust and efficient trajectory planner for quads                                                 | :heavy\_check\_mark: |
| [ego-planner swarm](https://github.com/ZJU-FAST-Lab/ego-planner-swarm)                                           | Zhejiang University | Autonomous and Decentralized Quadrotor Swarm System in Cluttered Environments                     |                      |
| [spatio-temporal semantic corridor](https://github.com/HKUST-Aerial-Robotics/spatiotemporal\_semantic\_corridor) | HKUST               | Safe Trajectory Generation For Complex Urban Environments Using Spatio-temporal Semantic Corridor |                      |
| [EVDodgeNet](https://github.com/prgumd/EVDodgeNet)                                                               | ETH                 | obstacle avoidance with event cameras                                                             |                      |
| [aeplanner](https://github.com/mseln/aeplanner)                                                                  | KTH                 | unknown environment exploration based on octomap                                                  |                      |
| [nvbplanner](https://github.com/ethz-asl/nbvplanner)                                                             | ETH                 | unknown environment exploration                                                                   |                      |
| [HKUST Aerial Robotics](https://github.com/HKUST-Aerial-Robotics/Teach-Repeat-Replan)                            | HKUST               | a complete and robust system for aggressive flight in complex environment                         |                      |
| [sim2real\_drone\_racing](https://github.com/uzh-rpg/sim2real\_drone\_racing)                                    | ETH                 | deep learning Sim2Real Drone racing                                                               | :heavy\_check\_mark: |
| [waypoint\_navigator](https://github.com/ethz-asl/waypoint\_navigator)                                           | ETH                 | high-level waypoint-following for micro aerial vehicles                                           | :heavy\_check\_mark: |
| [toppra](https://github.com/hungpham2511/toppra)                                                                 | Eureka Robotics     | Time-Optimal Path Parameterization                                                                |                      |

### Controls

| Link                                                                                                                                  | Who      | Description                                                                                                              | ROS                  |
| ------------------------------------------------------------------------------------------------------------------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------ | -------------------- |
| [neural\_mpc](https://github.com/aravindsrinivas/neural-mpc)                                                                          | Berkeley | Model Predictive Control with one-step feedforward neural network dynamics model from Model-based Reinforcement Learning |                      |
| [Control Toolbox](https://github.com/ethz-adrl/control-toolbox)                                                                       | ETH      | efficient C++ library for control, estimation, optimization and motion planning in robotics                              |                      |
| [PythonLinearNonlinearControl](https://github.com/Shunichi09/PythonLinearNonlinearControl)                                            |          | library implementing the linear and nonlinear control theories in python                                                 |                      |
| [rpg\_mpc](https://github.com/uzh-rpg/rpg\_mpc)                                                                                       | ETH      | Model Predictive Control for Quadrotors with extension to Perception-Aware MPC                                           |                      |
| [rpg\_quadrotor\_control](https://github.com/uzh-rpg/rpg\_quadrotor\_control)                                                         | ETH      | alternative to PX4 that works with RotorS                                                                                |                      |
| [gymFC](https://github.com/wil3/gymfc)                                                                                                |          | flight control tuning framework with a focus in attitude control                                                         |                      |
| [ACADO toolkit](http://acado.github.io/index.html)                                                                                    |          | MPC toolkit that takes care of the implementation                                                                        |                      |
| [MPC ETH](https://github.com/ethz-asl/mav\_control\_rw)                                                                               | ETH      | also has PX4 implementation (claim badly hacked though)                                                                  |                      |
| [DDC-MPC](https://github.com/uzh-rpg/data\_driven\_mpc)                                                                               | ETH      | Data-Driven MPC for Quadrotors                                                                                           |                      |
| [Deep-drone acrobatics](https://github.com/uzh-rpg/deep\_drone\_acrobatics)                                                           | ETH      | fly complex maneuvers with multi-layer perceptron                                                                        |                      |
| [mav\_control\_rw](https://github.com/ethz-asl/mav\_control\_rw)                                                                      | ETH      | trajectory tracking with MPC                                                                                             |                      |
| [rpg\_quadrotor\_control](https://github.com/uzh-rpg/rpg\_quadrotor\_control)                                                         | ETH      | complete framework for flying quadrotors                                                                                 |                      |
| [flight controller](https://github.com/HKUST-Aerial-Robotics/Teach-Repeat-Replan/tree/experiment/onboard\_computer/controller/n3ctrl) | HKUST    | high level controller compatible with DJI N3 flight controller                                                           |                      |
| [mavros\_trajectory\_tracking](https://github.com/mzahana/mavros\_trajectory\_tracking)                                               |          | combines mav\_trajectory\_generation and waypoint\_navigator with mavros\_controller                                     | :heavy\_check\_mark: |
| [system identification scripts](https://github.com/ethz-asl/mav\_system\_identification)                                              | ETH      | calculates model parameters for a drone                                                                                  |                      |
| [MRS UAV framework](https://github.com/ctu-mrs/mrs\_uav\_system)                                                                      | CTU      | framework for controlling drones with PX4 and different advanced controllers                                             |                      |

### Labs/Organizations to follow

| Lab Website                                           | Git                                              | Where                      |
| ----------------------------------------------------- | ------------------------------------------------ | -------------------------- |
| [Robotics & Perception Group](http://rpg.ifi.uzh.ch/) | [Link](https://github.com/uzh-rpg)               | Zurich, Switzerland        |
| [GRASP Lab](https://www.kumarrobotics.org/)           | [Link](https://github.com/KumarRobotics)         | Philadelphia, USA          |
| [ZJU FAST Lab](http://zju-fast.com/)                  | [Link](https://github.com/ZJU-FAST-Lab)          | Hangzhou, China            |
| [HKUST Aerial Robotics Group](http://uav.ust.hk/)     | [Link](https://github.com/HKUST-Aerial-Robotics) | Clear Water Bay, Hong Kong |
| [Team Aerial Robotics IIT Kanpur](http://ariitk.in/)  | [Link](https://github.com/AerialRobotics-IITK)   | Kanpur, India              |
