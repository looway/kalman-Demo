Z=(1:100);%�۲�ֵ
noise=randn(1,100);  %����Ϊ1�ĸ�˹����
Z=Z+noise;  %��������

X=[0;0];  %״̬
P=[1 0;0 1];  %״̬Э�������
F=[1 1;0 1];   %״̬ת�ƾ���
Q=[0.0001,0;0 0.0001];   %״̬ת��Э�������
H=[1 0];  %�۲����
R=1;   %�۲���������

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
    %plot(X(1),X(2));  %���㣬�����ʾλ�ã������ʾ�ٶ�
end
figure
plot(dis(1,:),dis(2,:))
xlabel('position')
ylabel('speed')
    