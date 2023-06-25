%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       随机信号分析实验
% 功能：计算窄带高斯随机过程同相和正交分量的功率谱密度
% 作者：BenSmithLight
% 开源地址：https://github.com/BenSmithLight/Stochastic-signal-analysis-experiment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 产生中心频率为f0为10kHz、带宽为500Hz的窄带高斯随机过程
% 参数设置
N = 10000; % 信号长度
fs = 22000; % 采样频率
f0 = 10000; % 中心频率
B = 500; % 带宽
fc1 = f0 - B / 2; % 带通系统的低截止频率
fc2 = f0 + B / 2; % 带通系统的高截止频率
n = 200; % 带通滤波器的阶数
nfft = N; % FFT长度

% 产生高斯白噪声信号
x = randn(1, N); % 使用randn函数产生高斯白噪声信号

%% 设计带通系统
b = fir1(n, [fc1 fc2] / (fs / 2), 'bandpass', hamming (n + 1)); % 使用fir1函数和hamming窗

% 计算输出信号
y = 40 * filter(b, 1, x); % 使用filter函数计算输出信号

%% 获取同相和正交分量
HX = imag(hilbert(y)); % 使用hilbert函数获取正交分量
t = 0:1 / fs:(N - 1) / fs; % 时间序列
Ac = y .* cos(2 * pi * f0 * t) + HX .* sin(2 * pi * f0 * t); % 同相分量
As = y .* sin(2 * pi * f0 * t) - HX .* cos(2 * pi * f0 * t); % 正交分量

%% 计算功率谱密度
[pxx_y, f_y] = periodogram(y, hamming (N), nfft, fs); % 使用periodogram函数和hamming窗
[pxx_Ac, f_Ac] = periodogram(Ac, hamming (N), nfft, fs); % 使用periodogram函数和hamming窗
[pxx_As, f_As] = periodogram(As, hamming (N), nfft, fs); % 使用periodogram函数和hamming窗

%% 绘制图像
figure;
subplot (3, 1, 1);
plot(f_y, 10 * log10(pxx_y)); title ('输出信号的功率谱密度'); xlabel ('频率（Hz）'); ylabel ('幅值（dB）');
subplot (3, 1, 2);
plot(f_Ac, 10 * log10(pxx_Ac)); title ('同相分量的功率谱密度'); xlabel ('频率（Hz）'); ylabel ('幅值（dB）');
subplot (3, 1, 3);
plot(f_As, 10 * log10(pxx_As)); title ('正交分量的功率谱密度'); xlabel ('频率（Hz）'); ylabel ('幅值（dB）');
