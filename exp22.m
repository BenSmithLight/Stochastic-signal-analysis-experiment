%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       随机信号分析实验
% 功能：高斯白噪声通过带通系统后的功率谱密度、功率传递函数、自相关函数
% 作者：BenSmithLight
% 开源地址：https://github.com/BenSmithLight/Stochastic-signal-analysis-experiment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 产生高斯白噪声信号
% 参数设置
N = 1000; % 信号长度
fs = 20000; % 采样频率
fc1 = 2000; % 带通系统的低截止频率
fc2 = 6000; % 带通系统的高截止频率
n = 100; % 带通滤波器的阶数
nfft = N; % FFT长度

% 产生高斯白噪声信号
x = wgn(1, N, 1, 'linear'); % 使用wgn函数，指定功率为1W

%% 设计带通系统
b = fir1(n, [fc1 fc2] / (fs / 2), 'bandpass', hamming (n + 1)); % 使用fir1函数和hamming窗

% 计算输出信号
y = filter(b, 1, x); % 使用filter函数计算输出信号

%% 计算相应数据
% 计算原信号的功率谱密度
[pxx_x, f_x] = periodogram(x, hamming (N), nfft, fs); % 使用periodogram函数和hamming窗

% 计算系统的功率传递函数
HW = fft (b, 2 * nfft); % 使用fft函数计算系统的频率响应
HW2 = abs(HW) .^ 2; % 计算系统的功率传递函数
w = (1:N) / N * 10000; % 计算频率坐标

% 计算输出信号的功率谱密度
[pxx_y, f_y] = periodogram(y, hamming (N), nfft, fs); % 使用periodogram函数和hamming窗

% 计算输出信号的自相关函数
[r_y, lags_y] = xcorr(y, 'biased'); % 使用xcorr函数计算自相关函数，'biased'表示归一化处理

%% 绘制图像
figure;
subplot (4, 1, 1);
plot(f_x, 10 * log10(pxx_x)); title ('原信号的功率谱密度'); xlabel ('频率（Hz）'); ylabel ('幅值（dB）');
subplot (4, 1, 2);
plot(w, abs(HW2(1:N))); title ('系统的功率传递函数'); xlabel ('频率（Hz）'); ylabel ('幅值');
subplot (4, 1, 3);
plot(f_y, 10 * log10(pxx_y)); title ('输出信号的功率谱密度'); xlabel ('频率（Hz）'); ylabel ('幅值（dB）');
subplot (4, 1, 4);
plot(lags_y / fs, r_y); title ('输出信号的自相关函数'); xlabel ('时间延迟（s）'); ylabel ('幅值');
xlim([-0.025 0.025]);
