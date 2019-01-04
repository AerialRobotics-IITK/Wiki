# transformation remapping



### transformation\[tf\]-remapping

* old: contains the name of tf that needs to be remapped
* new: new name of tf

  > example
  >
  > \`\`\`shell

  \[{old: /imu, new: /base\_link}\]

&lt;/launch&gt;

\`\`\`

* Subcribed topic

  > /tf\_old \(tf/tfMessage\) Old transform tree. This is usually published by remapping playback of a bag file. You may need to set use\_sim\_time true for the bag file transforms to be accepted.

* Published topics

  > /tf \(tf/tfMessage\) Current transform tree. This is the normal /tf topic.

