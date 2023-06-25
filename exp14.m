% 定义高斯分布的参数
mu = 0; % 均值
sigma = sqrt(4); % 标准差

% 定义x轴的范围
x = -10:0.1:10;

% 计算cdf和pdf的值
y_cdf = cdf('Normal', x, mu, sigma); % cdf 值
y_pdf = pdf('Normal', x, mu, sigma); % pdf 值

% 绘制曲线
figure;
subplot(2, 1, 1); % 绘制pdf
plot(x, y_pdf);
xlabel('x'); ylabel('pdf');
title('概率密度函数');

subplot(2, 1, 2); % 绘制cdf
plot(x, y_cdf);
xlabel('x'); ylabel('cdf');
title('累积分布函数');
