%% 生成10000个服从标准正态分布的随机数
x1 = randn(10000,1);

%% 绘制直方图
figure;
histogram(x1)
title('高斯随机变量的样本直方图')
xlabel('样本值')
ylabel('频数')

%% 生成10000个服从标准正态分布的随机数
x2 = randn(10000,1);

%% 转换成服从数学期望为2，方差为5的正态分布的随机数
y2 = sqrt(5)*x2 + 2;

%% 绘制直方图
figure;
histogram(y2)
title('高斯随机变量的样本直方图')
xlabel('样本值')
ylabel('频数')

%% 计算数学期望
M1 = mean(x1);
M2 = mean(y2);

%% 计算数学期望和方差
V1 = var(x1);
V2 = var(y2);
