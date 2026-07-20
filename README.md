# Multi-Granularity Contrastive Learning for Discovering Categories of Teacher Instructional Behavior Indicators (MGCL)

**Ting Cai, Qingyuan Tang, Yu Xiong, Lu Zhang, and Attila Pandu**

Research Center for Artificial Intelligence and Smart Education,  
Chongqing University of Posts and Telecommunications, Chongqing 400065, China

Chongqing Municipal Research Center for Educational Big Data,  
Chongqing 400065, China

University of Pécs, Pécs 7636, Hungary


**Corresponding author:** Yu Xiong


[Paper] | [Dataset Access] | [Project Page]


## Overview

This repository provides the official implementation of **MGCL (Multi-Granularity Contrastive Learning)**, a generalized category discovery framework designed for discovering teacher instructional behavior categories in complex classroom video scenarios.

Different from conventional video recognition methods that rely on predefined behavior categories, MGCL aims to simultaneously:

- recognize known teacher instructional behavior categories with labeled samples;
- discover previously undefined instructional behavior categories from unlabeled classroom videos.

To achieve this goal, MGCL introduces a multi-granularity contrastive learning strategy that optimizes video representations from three complementary perspectives:

- **Instance-level contrastive learning (IL-CL)**  
  Learns discriminative representations from labeled samples and preserves the semantic separation of known instructional behavior categories.

- **Neighborhood consistency contrastive learning (NC-CL)**  
  Constructs reliable neighborhood relationships through multi-metric similarity measurement and consensus filtering. Dynamic neighborhood aggregation enhances contextual representation learning for novel categories.

- **Global category-consolidation contrastive learning (GC-CL)**  
  Utilizes clustering-based pseudo-label refinement to progressively consolidate global category structures and reduce semantic ambiguity between known and novel categories.

MGCL provides an effective solution for discovering evolving teacher instructional behavior indicators in real classroom environments.


---

## Framework

The proposed MGCL framework consists of three collaboratively optimized components.


### 1. Instance-Level Contrastive Learning (IL-CL)

Supervised contrastive learning is performed on labeled samples to enhance intra-class compactness and inter-class separability of known teacher instructional behaviors.


### 2. Neighborhood Consistency Contrastive Learning (NC-CL)

A multi-metric neighborhood selection strategy is introduced by integrating:

- global similarity;
- local similarity;
- structural similarity.

Reliable neighbors are obtained through consensus filtering, followed by dynamic neighborhood aggregation to improve representation learning for both known and novel categories.


### 3. Global Category-Consolidation Contrastive Learning (GC-CL)

Periodically performed clustering and pseudo-label refinement are used to:

- estimate category structures;
- generate reliable pseudo labels;
- optimize global category consistency.

This process facilitates the discovery of novel instructional behavior categories while maintaining the discrimination of known categories.


---

## Dataset

Experiments are conducted on teacher instructional behavior datasets collected from real classroom environments.

The dataset contains:

- teacher classroom video clips;
- behavior category annotations;
- known and novel category splits for generalized category discovery evaluation.


Dataset access:

[Dataset Access]


---

## Environment

The experiments were conducted using the following environment:

- Python 3.10
- CUDA 11.7
- PyTorch 1.13.1
- torchvision
- scikit-learn
- NumPy
- SciPy


Install dependencies:

```bash
pip install -r requirements.txt
