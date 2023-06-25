%% 产生中心频率为f0为10kHz、带宽为500Hz的窄带高斯随机过程
% 参数设置
N = 10000; % 信号长度
fs = 22000; % 采样频率
f0 = 10000; % 中心频率
B = 500; % 带宽
fc1 = f0 - B/2; % 带通系统的低截止频率
fc2 = f0 + B/2; % 带通系统的高截止频率
n = 200; % 带通滤波器的阶数
nfft = N; % FFT长度
t = (0:N-1)/fs; % 时间序列

% 产生高斯白噪声信号
x = randn(1, N); % 使用randn函数产生高斯白噪声信号

%% 设计带通系统
b = fir1(n, [fc1 fc2] / (fs / 2), 'bandpass', hamming (n + 1)); % 使用fir1函数和hamming窗

% 计算输出信号
y = filter(b, 1, x); % 使用filter函数计算输出信号

% 计算包络、相位、包络平方
HX = imag(hilbert(y)); % 希尔伯特变换
Ac = y.*cos(2 * pi * f0 * t) + HX.*sin(2 * pi * f0 * t); % 解调
As = -y.*sin(2 * pi * f0 * t) + HX.*cos(2 * pi * f0 * t);
Ph = atan2(As, Ac); % 相位
A2 = Ac .^ 2 + As .^ 2; % 包络平方
At = sqrt(A2); % 包络

% 绘制概率分布直方图
figure(1)
subplot(2,2,1)
histogram(y,'Normalization','pdf')
xlabel('X')
ylabel('概率密度')
title('X的概率分布')
grid on

subplot(2,2,2)
histogram(At,'Normalization','pdf')
xlabel('A')
ylabel('概率密度')
title('A的概率分布')
grid on

subplot(2,2,3)
histogram(Ph,'Normalization','pdf')
xlabel('Φ')
ylabel('概率密度')
title('Φ的概率分布')
grid on

subplot(2,2,4)
histogram(A2,'Normalization','pdf')
xlabel('A^2')
ylabel('概率密度')
title('A^2的概率分布')
grid on
