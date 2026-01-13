# GSA_CRE
This is the source code of the paper "A new moment-independent uncertainty importance measure based on cumulative residual entropy for developing uncertainty reduction strategies"

If you find the code useful, please give a star :)

## Ref

Chen, Shi-Shun and Xiao-Yang Li. A new moment-independent uncertainty importance measure based on cumulative residual entropy for developing uncertainty reduction strategies. Mathematics and Computers in Simulation, 2026, 239: 263-281.

PDF: https://dirge1.github.io/shishun_chen.github.io/papers/Chen2026_MATCOM_CRE.pdf

Paper link: https://www.sciencedirect.com/science/article/pii/S0378475425002253

## Highlights

• Quantifying uncertainty magnitude is important in practical uncertainty reduction.

• CRE-based measures are developed for handling highly-skewed distributions.

• Numerical implementations are devised to estimate the proposed measure.

• A case of uncertainty reduction considering uncertainty magnitude is introduced.

• The proposed measure gives a different recommendation compared to the Sobol index.

The folder "code_sin" contains the source code of the Ishigami test function, and the folder "code_bearing" contains the source code of the bearing case.

In the folder, `cumu_res_entropy.m` is the calculation of CRE based on given data; `mutual_CRE2.m` is the proposed GSA measure of a single variable based on given data.
