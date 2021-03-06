# annotation_compute_mirtoolbox
A music feature Dataset generated by MIRtoolbox package in MATLAB for MOST Grant Proposal- Personalized Music Health Care Assisted by Deep Machine Learning

## Overview of the Proposal dataset

See https://github.com/DennyHsieh/music-health-dataset for a complete reference. (In Chinese)


## Description
- Files naming
  - Files in “annotation_file_mirtoolbox” folder are the features computing by MIRtoolbox ver. 1.7 package in MATLAB.
  - File names are named by “song_id-operator.txt”
  - If MIRtoolbox operator was not use, we generated a raw data for that feature.
- Feature description


| **Name**              | **Description**                         |
| --------------------- | --------------------------------------- |
| ***song_id***         | song ID for each music in MHCDL Dataset |
| ***kkbox_id***        | KKBOX ID for each music in KKBOX        |
| ***mirbrightness***   | general loudness of the track           |
| ***mirbrightness_r*** | loudness of the track                   |
| ***mirchromagram***   | chroma features for each segment        |
| ***mirkey***          | general key estimation of the track     |
| ***mirkey_r***        | key estimation of the track             |
| ***mirmode***         | general mode estimation of the track    |
| ***mirmode_r***       | mode estimation of the track            |
| ***mirpitch***        | pitch estimation of the track           |



## Reference
1. [MIRtoolbox — Humanities and Social Sciences](https://www.jyu.fi/hytk/fi/laitokset/mutku/en/research/materials/mirtoolbox)


## Acknowledgements

This research is partially supported by the Program of Ministry of Science and Technology, Taiwan, R.O.C. under Grant no. MOST 106-3114-E-007-013.
本研究感謝科技部「數位經濟前瞻技術研發與應用專案計畫」(MOST 106-3114-E-007-013)

