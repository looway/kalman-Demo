Z=(1:100);%观测值
noise=randn(1,100);  %方差为1的高斯噪声
Z=Z+noise;  %测量方程

X=[0;0];  %状态
P=[1 0;0 1];  %状态协方差矩阵
F=[1 1;0 1];   %状态转移矩阵
Q=[0.0001,0;0 0.0001];   %状态转移协方差矩阵
H=[1 0];  %观测矩阵
R=1;   %观察噪声方差

dis=zeros(2,100);
% figure;
% hold on;

for i=1:100
    X_=F*X;
    P_=F*P*F'+Q;
    K=P_*H'/(H*P_*H'+R);
    X=X_+K*(Z(i)-H*X_);
    P=(eye(2)-K*H)*P_;
    
    dis(:,i)=X;
    %plot(X(1),X(2));  %画点，横轴表示位置，纵轴表示速度
end
figure
plot(dis(1,:),dis(2,:))
xlabel('position')
ylabel('speed')
    