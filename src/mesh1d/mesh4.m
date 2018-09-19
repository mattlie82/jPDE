% create circular mesh
% ele and node files

N    = 100;
Nele =   N;
Nphi =   2;
Nattr=   1;

phi = linspace(0,2*pi,N+1);
phi = phi(1:N);

r = 1 + 0.3*sin(4*phi);

x = r.*sin(phi);
y = r.*cos(phi);

ele = zeros(Nele,2);

ele(:,1)=1:N;
ele(:,2)=[2:N 1];

idv    = zeros(N,1);
ide    = ones(Nele,1);

fid = fopen('mesh4.node','w');
fprintf(fid,'%i %i %i %i\n',N,2,0,1);
for i=1:N
    fprintf(fid,'%i %e %e %i\n',i,x(i),y(i),idv(i));
end
fprintf(fid,'# generated by mesh4.m\n')
fclose(fid);

fid = fopen('mesh4.ele','w');
fprintf(fid,'%i %i %i\n',Nele,Nphi,Nattr);
for i=1:Nele
    fprintf(fid,'%i %i %i %i\n',i,ele(i,1),ele(i,2),ide(i));
end
fprintf(fid,'# generated by mesh4.m\n')
fclose(fid)
