%% 产生高斯白噪声
% 参数设置
N = 10000; % 信号长度
fs = 22000; % 采样频率
f0 = 10000; % 中心频率
B = 400; % 带宽
fc1 = f0 - B / 2; % 带通系统的低截止频率
fc2 = f0 + B / 2; % 带通系统的高截止频率
n = 50; % 带通滤波器的阶数
nfft = N; % FFT长度
sigma = 1; % 高斯白噪声的标准差
t = 0: 1 / fs: (N - 1) / fs; % 时间序列

% 产生高斯白噪声信号
x = sigma*randn(1,N); % 高斯白噪声

%% 通过窄带系统
b = fir1(n, [fc1 fc2] / (fs / 2), 'bandpass', hamming (n + 1)); % 使用fir1函数和hamming窗

% 计算输出信号
Xt = filter(b, 1, x); % 使用filter函数计算输出信号
Xt = Xt/sqrt(var(Xt)); 

%% 叠加余弦信号
% 生成余弦信号
A1 = 2; % 幅度
A2 = 4;
A3 = 8;
phi1 = pi / 6; % 相位
phi2 = pi / 4;
phi3 = pi / 3;

Yt1 = A1 * cos(2 * pi * f0 * t + phi1); % 余弦信号
Yt2 = A2 * cos(2 * pi * f0 * t + phi2);
Yt3 = A3 * cos(2 * pi * f0 * t + phi3);

% 合成信号
Zt1 = Xt + Yt1; % 合成信号
Zt2 = Xt + Yt2;
Zt3 = Xt + Yt3;

%% 计算包络、相位、包络平方
HX1 = imag(hilbert(Zt1)); % 希尔伯特变换
Ac1 = Zt1.*cos(2 * pi * f0 * t) + HX1.*sin(2 * pi * f0 * t); % 解调
As1 = -Zt1.*sin(2 * pi * f0 * t) + HX1.*cos(2 * pi * f0 * t);
Ph1 = atan2(As1, Ac1); % 相位
A2_1 = Ac1 .^ 2 + As1 .^ 2; % 包络平方
At1 = sqrt(A2_1); % 包络

HX2 = imag(hilbert(Zt2)); % 希尔伯特变换
Ac2 = Zt2.*cos(2 * pi * f0 * t) + HX2.*sin(2 * pi * f0 * t); % 解调
As2 = -Zt2.*sin(2 * pi * f0 * t) + HX2.*cos(2 * pi * f0 * t);
Ph2 = atan2(As2, Ac2); % 相位
A2_2 = Ac2 .^ 2 + As2 .^ 2; % 包络平方
At2 = sqrt(A2_2); % 包络

HX3 = imag(hilbert(Zt3)); % 希尔伯特变换
Ac3 = Zt3.*cos(2 * pi * f0 * t) + HX3.*sin(2 * pi * f0 * t); % 解调
As3 = -Zt3.*sin(2 * pi * f0 * t) + HX3.*cos(2 * pi * f0 * t);
Ph3 = atan2(As3, Ac3); % 相位
A2_3 = Ac3 .^ 2 + As3 .^ 2; % 包络平方
At3 = sqrt(A2_3); % 包络

% 计算概率分布
[pe1, xe1] = ksdensity(At1); % 包络的概率分布
[pp1, xp1] = ksdensity(Ph1); % 相位的概率分布
[pe1, xe2_1] = ksdensity(A2_1); % 包络平方的概率分布

[pe2, xe2] = ksdensity(At2); % 包络的概率分布
[pp2, xp2] = ksdensity(Ph2); % 相位的概率分布
[pe2, xe2_2] = ksdensity(A2_2); % 包络平方的概率分布

[pe3, xe3] = ksdensity(At3); % 包络的概率分布
[pp3, xp3] = ksdensity(Ph3); % 相位的概率分布
[pe3, xe2_3] = ksdensity(A2_3); % 包络平方的概率分布

% 绘制概率分布图像
figure;
subplot(3, 1, 1)
plot(xe1, pe1)
hold on;
plot(xe2, pe2)
plot(xe3, pe3)
legend('A=2', 'A=4', 'A=8')
hold off;
xlabel('包络')
ylabel('概率密度')
title('包络的概率分布')

subplot(3, 1, 2)
plot(xp1-phi1, pp1)
hold on;
plot(xp2-phi2, pp2)
plot(xp3-phi3, pp3)
xlim([-2 2])
legend('A=2', 'A=4', 'A=8')
hold off;
xlabel('相位(rad)')
ylabel('概率密度')
title('相位的概率分布')

subplot(3, 1, 3)
plot(xe2_1, pe1)
hold on;
plot(xe2_2, pe2)
plot(xe2_3, pe3)
legend('A=2', 'A=4', 'A=8')
hold off;
xlabel('包络平方')
ylabel('概率密度')
title('包络平方的概率分布')
