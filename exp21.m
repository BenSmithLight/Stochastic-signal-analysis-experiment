% 设计FIR滤波器
b = fir1(100, [0.25 0.55], 'bandpass', hamming(101));
% 100阶，截止频率为0.25pi和0.55pi的带通滤波器，窗函数为hamming窗

% 绘制幅频特性曲线
freqz(b, 1, 512, 2); % 512点FFT，归一化频率，单位为pi

% 修改坐标轴信息
subplot(2, 1, 1);
xlabel('归一化频率');
ylim([-100 20]);
subplot(2, 1, 2);
xlabel('归一化频率');
ylim([-4000 1000]);
