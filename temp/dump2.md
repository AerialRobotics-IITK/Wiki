# dump2

### Readme

For understanding about quaternions please see the documentation in the quaternions.pdf and the quaternions.md in this folder.

## Sources <a id="sources"></a>

​[Source Link](http://wiki.roblox.com/index.php?title=Quaternions_for_rotation#Quaternion_from_a_Rotation_Matrix)​

​[CFrame Library](http://wiki.roblox.com/index.php?title=CFrame)​

​[Understanding Euler Angles](http://wiki.roblox.com/index.php?title=Euler_angles)​

​[Source Link](http://www.weizmann.ac.il/sci-tea/benari/sites/sci%20tea.benari/files/uploads/softwareAndLearningMaterials/quaternion-tutorial-2-0.pdf)​

### Quaternions

​[HardlyDifficult.com/Tutorials/Quaternions](https://hardlydifficult.com/Tutorials/Quaternions)​

## Intro to Quaternion Rotations \(with Unity 2017\) <a id="intro-to-quaternion-rotations-with-unity-2017"></a>

​[View on YouTube](https://youtu.be/kYOtk5a6_x4)​

Goal: This tutorial introduces working with rotations, with a focus on Quaternions. Some math that goes into Quaternions is included; it may help to explain what these numbers represent, but it's not necessary to know when working with a game engine. By the end, you should feel comfortable using Quaternions in Unity.

* 1.\) Euler Rotations
  * 1.1\) [About Euler](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#11-about-euler)​
  * 1.2\) [Gimbal lock](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#12-gimbal-lock)​
  * 1.3\) [Working with Euler](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#13-working-with-euler)​
* 2.\) Axis-Angle Rotations
  * 2.1\) [About Axis-Angle](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#21-about-axis-angle)​
  * 2.2\) [Working with Axis-Angle](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#22-working-with-axis-angle)​
* 3.\) Quaternion Rotations
  * 3.1\) [About Quaternions](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#31-about-quaternions)​
  * 3.2\) [Properties of a Quaternion](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#32-properties-of-a-quaternion)​
  * 3.3\) Creating Quaternions
    * 3.3.1\) [Quaternion Constructors](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#331-quaternion-constructors)​
    * 3.3.2\) [Quaternion.LookRotation](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#332-quaternionlookrotation)​
    * 3.3.3\) [Quaternion.FromToRotation](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#333-quaternionfromtorotation)​
    * 3.3.4\) [Math for Creating Quaternions](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#334-math-for-creating-quaternions)​
  * 3.4\) Interpolating Rotations
    * 3.4.2\) [Quaternion.Slerp](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#341-quaternionSlerp)​
    * 3.4.1\) [Quaternion.Lerp](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#342-quaternionLerp)​
    * 3.4.3\) [Quaternion.RotateTowards](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#343-quaternionrotatetowards)​
    * 3.4.4\) [Math for Quaternion Lerp](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#344-math-for-quaternion-Lerp)​
  * 3.5\) Combining Rotations
    * 3.5.1\) [Quaternion \* Quaternion](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#351-quaternion--quaternion)​
    * 3.5.2\) [Math for Quaternion/Quaternion Multiplication](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#352-math-for-quaternionquaternion-multiplication)​
  * 3.6\) Inverse Rotation
    * 3.6.1\) [Quaternion.Inverse](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#361-quaternioninverse)​
    * 3.6.2\) [Math for Quaternion Inverse](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#362-math-for-quaternion-inverse)​
  * 3.7\) Rotating Vectors
    * 3.7.1\) [Quaternion \* Vector3 \(or Vector2\)](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#371-quaternion--vector3-or-vector2)​
    * 3.7.2\) [Math for Quaternion/Vector3 Multiplication](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#372-math-for-quaternionvector3-multiplication)​
  * 3.8\) Comparing Rotations
    * 3.8.1\) [Dot Product / Quaternion.Dot](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#381-dot-product--quaterniondot)​
    * 3.8.2\) [Quaternion.Angle](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#382-quaternionangle)​
    * 3.8.3\) [Quaternion == Quaternion](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#383-quaternion--quaternion)​
    * 3.8.4\) [Math for Quaternion Dot](https://gajena.gitbook.io/aerial-robotics/quaternion/quaternions#384-math-for-quaternion-dot)​

### 1\) Euler Rotations <a id="1-euler-rotations"></a>

#### 1.1\) About Euler <a id="1-1-about-euler"></a>

When we think of rotations, we typically think in terms of 'Euler' \(pronounced oi-ler\). Euler rotations are degrees of rotation around each axis; e.g., \(0, 0, 30\) means "rotate the object by 30 degrees around the Z axis."

In the Inspector, modifying a Transform's rotation is done in Euler. In code, you can either work with Quaternions directly, or use Euler \(or other representation\) and then convert it back to Quaternion for storage.

#### 1.2\) Gimbal lock <a id="1-2-gimbal-lock"></a>

The main reason that Euler is not the primary way of storing and manipulating rotations in a game is because of issues which arise from "Gimbal lock".

Gimbal lock is a situation in which 2 of the rotation axes collapse, effectively representing the same movement. This means instead of the usual 3 degrees of freedom \(x, y, and z\), you only have two.

Here is an example. Once an object reaches 90 degrees on the X axis, the Y and Z axes collapse, and modifying either produces the same results \(where a change to Y is the same as a negative change to Z\).![](https://i.imgur.com/pWILGUW.gif)

​[View source for this example](https://github.com/hardlydifficult/EduQuaternions/blob/master/Assets/GimbalLockAnimation.cs).

Gimbal lock is not an all-or-nothing situation. As you approach certain angles, the impact of changing axes may not offer the full range of motion that you might expect.

Note that Euler can represent any possible rotation. Gimbal lock is only a concern when modifying or combining rotations.

For a lot more detail - see [Wikipedia's article on Gimbal Lock](https://en.wikipedia.org/wiki/Gimbal_lock) or [GuerrillaCG's video on Gimbal Lock](https://www.youtube.com/watch?v=zc8b2Jo7mno&feature=youtu.be&t=176).

#### 1.3\) Working with Euler <a id="1-3-working-with-euler"></a>

Given a Quaternion, you can calculate the Euler value like so:

```text

```

Euler rotations are stored as a Vector3. You can perform any of the operations you might use on a position Vector3 such as +, \*, and Lerp. Then, given an Euler value, you can calculate the Quaternion:

```text

```

### 2\) Axis-Angle Rotations <a id="2-axis-angle-rotations"></a>

#### 2.1\) About Axis-Angle <a id="2-1-about-axis-angle"></a>

Another way of representing rotations is Axis-Angle. This approach defines both an axis and the angle defining how much to rotate around that axis.

Here is a simple example where we are rotating around the X axis only. When the axis is one of the world axes like this, the angle is equivalent to an Euler angle.![](https://i.imgur.com/YPelrfF.gif)

​[View source for this example](https://github.com/hardlydifficult/EduQuaternions/blob/master/Assets/AxisAngleAnimation.cs) and the one below.

The following example shows a more complex rotation where the axis is not aligned with a world axis.

* It's hard to see with this render, but in the perspective on the right the red axis line is not just straight up and down, but also angled from front to back.
* The bottom two perspectives show the same rotation ,but with a straight-on view of the axis itself.

![](https://i.imgur.com/5zCrTdn.gif)

Axis-Angle and other rotation approaches, including Quaternions and Matrices, are not impacted by Gimbal Lock.

#### 2.2\) Working with Axis-Angle <a id="2-2-working-with-axis-angle"></a>

Given a Quaternion, you can calculate the Axis-Angle value like so:

```text

```

You could modify the angle or even the axis itself. Then given an Axis-Angle value, you can calculate the Quaternion:

```text

```

### 3\) Quaternion Rotations <a id="3-quaternion-rotations"></a>

#### 3.1\) About Quaternions <a id="3-1-about-quaternions"></a>

A Quaternion is an axis-angle representation scaled in a way which optimizes common calculations, such as combining multiple rotations and interpolating between different rotation values.

The default rotation for an object known as 'identity' is \(0, 0, 0\) in Euler and \(0, 0, 0, 1\) in Quaternion. If you multiply a rotation by identity, the rotation does not change.

#### 3.2\) Properties of a Quaternion <a id="3-2-properties-of-a-quaternion"></a>

Quaternions are composed of 4 floats, like an Axis-Angle. The first three \(x, y, z\) are logically grouped into a vector component of the Quaternion and the last value \(w\) is a scalar component. Some of the math below shows how these parts may be considered separately.

Quaternion rotations must be normalized, meaning:

```text

```

Knowing the Quaternion rotations are normalized simplifies some of the math for using and manipulating Quaternions.

The performance Quaternions offer comes with a small cost in terms of storage. A rotation technically has 3 degrees of freedom, which means that it may be represented with 3 floats \(like an Euler\); however, a Quaternion requires 4 floats. This tradeoff has been deemed worthwhile by the industry for the performance when a game is running. If size matters, such as for network communication, quaternions may be compressed as well as an Euler could be.

#### 3.3\) Creating Quaternions <a id="3-3-creating-quaternions"></a>

**3.3.1\) Quaternion Constructors**

In Unity, rotations are stored as Quaternions. You can construct a Quaternion from the calculated components.

```text

```

Generally, you would not use the Quaternion constructor. Selecting the values for x, y, z, w to create the rotation you are looking for is difficult for people to do.

Often, rotations are created as Euler and then converted to Quaternion. Then, Quaternions are used to modify other Quaternions using the techniques covered later in this tutorial. See the Euler and Axis-Angle sections above for examples on how-to convert rotation formats.

For the 'identity' rotation, instead of using the Quaternion constructor, you should use the Quaternion.identity variable:

```text

```

Note that the 'default' Quaternion is not a valid rotation, and may not be used with any rotation method:

```text

```

**3.3.2\) Quaternion.LookRotation**

LookRotation creates a rotation which will orient an object so that its forward will face the target forward direction. Its up will face the target up direction as best it can while maintaining the target forward. The up direction defaults to the world's positive Y direction, but you could change this; for example, making it the negative Y direction to rotate an object upside down.

In the following example \(code followed by gif\), an object is rotated so that it's always facing away from the camera \(since the camera defaults to a negative Z position in the world, it is behind objects by default\).

```text

```

Note that the input directions do not need to be normalized.![](https://i.imgur.com/nK9ijDJ.gif)

​[View source for this example](https://github.com/hardlydifficult/EduQuaternions/blob/master/Assets/LookRotation.cs).

**3.3.3\) Quaternion.FromToRotation**

FromToRotation creates a rotation which would modify a Vector's direction so that after the rotation the Vector is facing the given target direction. In the following example, we rotate an object so that its 'back' direction faces the camera \(creating the same effect as the example above\).

```text

```

Note that the input directions do not need to be normalized.

**3.3.4\) Math for Creating Quaternions**

Here is the formula for Quaternion, given an axis-angle rotation. You don't need to know this when working in Unity.

```text

```

#### 3.4\) Interpolating Rotations <a id="3-4-interpolating-rotations"></a>

**3.4.1\) Quaternion.Slerp**

Slerp, or **s**pherical **l**inear int**erp**olation, is a fancy term for a simple concept. If you were to smoothly/evenly rotate from rotation A to B, Slerp is the formula that calculates the interim rotation given a percent progress from 0 to 1, named 't'. For example:

```text

```

Another way of leveraging the Slerp method is by using it in an update loop and providing the same constant for 't' each frame instead of using a percent complete. Each frame it will close a percent of the remaining gap, this will create a motion that slows the closer it is to the target rotation.

```text

```

The following is an example of the two different ways of leveraging 't' in Slerp:![](https://i.imgur.com/Mlaxbvo.gif)

​[View source for this example](https://github.com/hardlydifficult/EduQuaternions/blob/master/Assets/Lerp.cs) and the Lerp example below.

The performance of Slerp is almost on-par with Lerp. We tested running Slerp or Lerp 10k times per frame in Unity and there was no measurable difference between them.

**3.4.2\) Quaternion.Lerp**

Lerp, or **l**inear int**erp**olation, for rotations is very similar to Slerp. It follows a straight line between rotations instead of curving to ensure a constant angular velocity like Slerp does.

You can use Lerp the exact same way you use Slerp. For example:

```text

```

The following example shows two objects, one which is rotating with Lerp \(blue\) and the other with Slerp \(red\). Note that they exactly the same at the start, middle, and end; and there is very little different in between.![](https://i.imgur.com/hfmmzoh.gif)

See also [Higeneko's Slerp vs Lerp visualization](https://www.youtube.com/watch?v=uNHIPVOnt-Y).

**3.4.3\) Quaternion.RotateTowards**

RotateTowards is an alternative to Slerp/Lerp for selecting a rotation between two other rotations. RotateTowards uses a fixed rotation speed instead of rotating by percent \(like Slerp and Lerp\).

You can use RotateTowards like you use Slerp and Lerp; however, instead of specifying 't' you are providing a speed which is equal to the max degrees the object may rotate this frame.

```text

```

To help clarify some use case differences between each of these interpolation options:

* Use RotateTowards when you want to rotate with a fixed angular velocity.
* Use Slerp with t = percentComplete when you want the rotation to complete in a fixed amount of time.
* Use Slerp with t = constant when you want the rotation to start fast and slow down as it approaches the target rotation.
* Consider using Lerp over Slerp when you need some acceleration and deceleration at the start/end to smooth the experience Slerp offers.

**3.4.4\) Math for Quaternion Lerp**

In Unity, you should use the method above. However, for the interested, below is how the Lerp may be calculated.

```text

```

When a Lerp calculation is performed, the values need to be normalized so that the resulting Quaternion is normalized.

#### 3.5\) Combining Rotations <a id="3-5-combining-rotations"></a>

**3.5.1\) Quaternion \* Quaternion**

Often you need to combine rotations. With Quaternions this is done with multiplication.

```text

```

You can use multiplication to combine any number of rotations \(e.g., grandparent _parent_ child\).

When combining rotations, a parent GameObject may rotate the parent and a child, and then the child could add an additional rotation of its own. With Quaternions, you write the multiplication such that the parent comes before the child. Order matters, as shown in this example:![](https://i.imgur.com/dO5omUB.gif)

​[View source for this example](https://github.com/hardlydifficult/EduQuaternions/blob/master/Assets/MirrorRotation.cs) and the next.

**3.5.2\) Math for Quaternion/Quaternion Multiplication**

In Unity, you should use the method above. However, for the interested, below is how multiplication may be calculated.

```text

```

#### 3.6\) Inverse Rotation <a id="3-6-inverse-rotation"></a>

**3.6.1\) Quaternion.Inverse**

The inverse of a rotation is the opposite rotation; if you apply a rotation and then apply the inverse of that rotation, it results in no change.![](https://i.imgur.com/F6kNDmJ.gif)

```text

```

**3.6.2\) Math for Quaternion Inverse**

In Unity, you should use the method above. However, for the interested, below is how the inverse may be calculated.

```text

```

#### 3.7\) Rotating Vectors <a id="3-7-rotating-vectors"></a>

**3.7.1\) Quaternion \* Vector3 \(or Vector2\)**

Given a vector, you can calculate its position after a rotation has been applied. For example, given an offset from the center, you can rotate to orbit around that center point.

In Unity, you can simply use the multiplication symbol, for example:

```text

```

You must have the Quaternion before the Vector for multiplication \(i.e., offsetPosition \* rotation does not work\).![](https://i.imgur.com/SjxHgY1.gif)

​[View source for this example](https://github.com/hardlydifficult/EduQuaternions/blob/master/Assets/RotateVertex.cs).

**3.7.2\) Math for Quaternion/Vector3 Multiplication**

In Unity, you should use the method above. However, for the interested, below is how multiplication may be calculated.

```text

```

The approach above creates a Quaternion for the position simply to enable the multiplication operations required. It's possible to implement this algorithm without reusing the Quaternion data structure in this way.

#### 3.8\) Comparing Rotations <a id="3-8-comparing-rotations"></a>

**3.8.1\) Dot Product / Quaternion.Dot**

Dot product is a fast operation which informs you how well-aligned two rotations are to each other. A dot product of 1 means the two rotations are identical, and -1 means they are oriented in opposite directions.

The dot product does not include direction. For example, a value of .9 tells you that you are nearly facing the same direction, but does not give you enough information to rotate closer to 1.

```text

```

**3.8.2\) Quaternion.Angle**

Angle returns the difference between two rotations in degrees. This is very similar to the information you get from the Dot product, but returned in degrees, which may be useful for some scenarios.

```text

```

**3.8.3\) Quaternion == Quaternion**

The equals operator \(operator==\) uses the dot product to test if two rotations are nearly identical.

```text

```

Note that in general, using "==" is not recommended when floats are involved as tiny rounding issues may result in differences which have no impact on the game. Unity has addressed this concern in a custom operator== method for Quaternions, so that "==" is safe to use.

**3.8.4\) Math for Quaternion Dot**

In Unity, you should use the method above. However, for the interested, below is how the dot product may be calculated.

```text

```

## GG <a id="gg"></a>

That's all for now. Questions, issues, or suggestions? Please use the [YouTube comments](https://youtu.be/kYOtk5a6_x4).

Support on [Patreon](https://www.patreon.com/HardlyDifficult), with [Paypal](https://u.muxy.io/tip/HardlyDifficult), or by subscribing on [Twitch](https://www.twitch.tv/HardlyDifficult/subscribe) \(free with Amazon Prime\).

​[License](https://creativecommons.org/licenses/by/4.0/). Created live at [twitch.tv/HardlyDifficult](https://www.twitch.tv/HardlyDifficult) August 2017.



