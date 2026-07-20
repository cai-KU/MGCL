Multi-Granularity Contrastive Learning for Discovering Categories of Teacher Instructional Behavior Indicators
Ting Cai, Qingyuan Tang, Yu Xiong, Lu Zhang, and Attila Pandu

Research Center for Artificial Intelligence and Smart Education,
Chongqing University of Posts and Telecommunications, Chongqing 400065, China

Chongqing Municipal Research Center for Educational Big Data,
Chongqing 400065, China

University of Pécs, Pécs 7636, Hungary

Corresponding author: Yu Xiong

[Paper] | [Dataset Access] | [Project Page]

Overview
This repository provides the official implementation of MGCL, a multi-granularity contrastive learning framework for generalized category discovery of teacher instructional behavior indicators.

MGCL jointly performs feature optimization at three levels:

Instance-level contrastive learning (IL-CL) learns discriminative representations from labeled samples.
Neighborhood consistency contrastive learning (NC-CL) selects reliable neighbors using complementary global, local, and structural similarities.
Global category-consolidation contrastive learning (GC-CL) refines category boundaries using pseudo-label-based global supervision.
The framework is designed to recognize known teacher instructional behavior categories and discover previously undefined categories from unlabeled classroom videos.

Framework
MGCL consists of three collaboratively optimized components:

Instance-level contrastive learning

Supervised contrastive learning is applied to labeled samples to preserve the discrimination of known behavior categories.

Neighborhood consistency contrastive learning

Multi-metric neighborhood selection and consensus filtering are used to construct reliable neighborhood relationships. Dynamic neighborhood aggregation further improves the representation of novel categories.

Global category-consolidation contrastive learning

Agglomerative clustering and pseudo-label refinement are periodically performed to consolidate global category structures and reduce the semantic bias between known and novel categories.

Environment
The experiments were conducted with the following environment:

Python 3.10
CUDA 11.7
PyTorch 1.13.1
torchvision
scikit-learn
NumPy
SciPy
Install the required dependencies using:

pip install -r requirements.txt
