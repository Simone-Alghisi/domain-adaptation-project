# Unsupervised Domain Adaptation (UDA) Project
A repository containing the Domain Adaptation notebook for the Deep Learning course of the University of Trento (AA 2021-2022).

## Group Members
* [Simone Alghisi](https://github.com/Simone-Alghisi/)
* [Massimo Rizzoli](https://github.com/massimo-rizzoli)

## Proposed techniques
For this project we've used Discrimination Based Techniques for the most, by relying on the popular MMD loss for understanding the domain alignment. In general, we have implemented

* *Deep Domain Confusion* (between single and multiple layers), i.e. the classic implementation of MMD loss for solving UDA problems;
* *DSAN* (Deep Subdomain Adaptation Network), i.e. a more recent approach based on subdomain alignment;
* *DRCN* (Deep Reconstruction Classification Network), i.e. a different approach for UDA based on a multi-task approach using a decoder together with the classifier.

For more in depth details, please refer to the [notebook](./domain-adaptation-project.ipynb).

## Notes
Please keep in mind that the following project has been developed from Google Colab. To avoid possible incompatibilities issues, please load it and run it from there.