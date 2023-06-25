%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       随机信号分析实验
% 功能：设计FIR带通数字滤波器并绘制幅频响应曲线
% 作者：BenSmithLight
% 开源地址：https://github.com/BenSmithLight/Stochastic-signal-analysis-experiment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 设计FIR滤波器
b = fir1(100, [0.25 0.55], 'bandpass', hamming(101));
% 100阶，截止频率为0.25pi和0.55pi的带通滤波器，窗函数为hamming窗

%% 绘制幅频特性曲线
freqz(b, 1, 512, 2); % 512点FFT，归一化频率，单位为pi

% 修改坐标轴信息
subplot(2, 1, 1);
xlabel('归一化频率');
ylim([-100 20]);
subplot(2, 1, 2);
xlabel('归一化频率');
ylim([-4000 1000]);
