%
% DEMO para la modulaci�n y demodulaci�n de una se�al de espectro
% ensanchado por secuencia directa
% -------------------------------------------------------------------------
% DEMO for the modulation and demodulation of a OFDM modulation
%
%--------------------------------------------------------------------------
%
% LABORATORIO DE COMUNICACIONES DIGITALES   
%
%        Versi�n: 1.0
%  Realizado por: Marcelino L�zaro
%                 Departamento de Teor�a de la Se�al y Comunicaciones
%                 Universidad Carlos III de Madrid
%      Creaci�n : noviembre 2018
% Actualizaci�n : noviembre 2022
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Par�metros generales de la simulaci�n
% General parameters for the simulation
%--------------------------------------------------------------------------
T=1;            % Tiempo de s�mbolo / Symbol length
N=4;            % N�mero de portadoras / Number of carriers
M = 16;                 % Orden de la constelaci�n (Constellation order)
m = log2(M);            % Bits por s�mbolo (Bits per symbol)
nBlocks=1e5;            % N�mero de bloques / Number of blocks
nSymb = nBlocks*N;      % Number of symbols in the simulation
nBits = nSymb * m;      % Number of bits in the simulation
tAssign = 'gray';       % Type of binary assignement ('gray', 'bin')

d=[1];

varNoise=0;
%--------------------------------------------------------------------------
% Modulation
%--------------------------------------------------------------------------
% Generaci�n de bits (Generation of Bits) 
B = randi([0 1],nBits,1);
% Codificaci�n de bits en s�mbolos (Symbols encoded from bits)
A = qammod(B,M,tAssign,'InputType','bit'); 
%B=genera_bits(Nbits);
%A=codifica_gray_qam(B,M);
% Conversi�n serie a paralelo / Serial to parallel conversion
Ak=reshape(A,N,nBlocks);
sb=N/sqrt(T)*ifft(Ak,N,1);
% Conversi�n paralelo a serie / Parallel to serial conversion
s=reshape(sb,1,nSymb);
%--------------------------------------------------------------------------
% Transmission
%--------------------------------------------------------------------------
Kd=length(d)-1;
v=conv([zeros(1,Kd),s],d);
v=v(Kd+1:Kd+length(s));
v=v+sqrt(varNoise/2)*randn(size(v))+j*sqrt(varNoise/2)*randn(size(v));
%--------------------------------------------------------------------------
% Demodulation
%--------------------------------------------------------------------------
% Serial to parallel
vp=reshape(v,N,nBlocks);
qk=1/sqrt(T)*fft(vp,N,1);
%--------------------------------------------------------------------------
% Visualization
%--------------------------------------------------------------------------
p=OFDM_p(d,N);
Pe=zeros(1,N);
disp('Probabilidades de error / Error probabilities')
for k=1:N
    pk=p{k,k};
    qn=qk(k,:)/pk(1);
    Bke = qamdemod(qn,M,tAssign,'OutputType','bit');
    Ake = qammod(Bke,M,tAssign,'InputType','bit'); 
    %Ake=decisor_qam(qn,M);
    Pe(k)=length(find(Ake~=Ak(k,:)))/length(Ake);
    disp(['  Pe (k=',num2str(k-1),') = ',num2str(Pe(k))])
end
disp(['Pe (mean) = ',num2str(mean(Pe))])
