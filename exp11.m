%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       随机信号分析实验
% 功能：熟悉periodogram函数的使用
% 作者：BenSmithLight
% 开源地址：https://github.com/BenSmithLight/Stochastic-signal-analysis-experiment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = 0:319; % 定义序列
x = cos(pi / 4 * n) + randn(size(n)); % 生成余弦信号+高斯白噪声序列
periodogram(x, hamming(length(x))) % 分析信号的功率谱密度
