%
% DEMO para la modulación y demodulación de una señal de espectro
% ensanchado por secuencia directa
% -------------------------------------------------------------------------
% DEMO for the modulation and demodulation of a OFDM modulation
%
%--------------------------------------------------------------------------
%
% LABORATORIO DE COMUNICACIONES DIGITALES   
%
%        Versión: 1.0
%  Realizado por: Marcelino Lázaro
%                 Departamento de Teoría de la Señal y Comunicaciones
%                 Universidad Carlos III de Madrid
%      Creación : noviembre 2018
% Actualización : noviembre 2022
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Parámetros generales de la simulación
% General parameters for the simulation
%--------------------------------------------------------------------------

T       = 1;            % Tiempo de símbolo / Symbol length
N       = 16;           % Número de portadoras / Number of carriers
M       = 16;           % Orden de la constelación (Constellation order)
m       = log2(M);      % Bits por símbolo (Bits per symbol)
nBlocks = 1e5;          % Número de bloques / Number of blocks
nSymb   = nBlocks*N;    % Number of symbols in the simulation
nBits   = nSymb * m;    % Number of bits in the simulation
tAssign = 'gray';       % Type of binary assignement ('gray', 'bin')


function Pe = experiment(d, varNoise, C)
    T       = 1;            % Tiempo de símbolo / Symbol length
    N       = 16;           % Número de portadoras / Number of carriers
    M       = 16;           % Orden de la constelación (Constellation order)
    m       = log2(M);      % Bits por símbolo (Bits per symbol)
    nBlocks = 1e5;          % Número de bloques / Number of blocks
    nSymb   = nBlocks*N;    % Number of symbols in the simulation
    nBits   = nSymb * m;    % Number of bits in the simulation
    tAssign = 'gray';       % Type of binary assignement ('gray', 'bin')

    %--------------------------------------------------------------------------
    % Modulation
    %--------------------------------------------------------------------------
    % Generación de bits (Generation of Bits) 
    B = randi([0 1],nBits,1);
    % Codificación de bits en símbolos (Symbols encoded from bits)
    A = qammod(B,M,tAssign,'InputType','bit'); 
    %B=genera_bits(Nbits);
    %A=codifica_gray_qam(B,M);
    % Conversión serie a paralelo / Serial to parallel conversion
    Ak=reshape(A,[],nBlocks);
    sb=N/sqrt(T)*ifft(Ak,N,1);

    prefix=sb(end-C+1:end,:);
    sbc=[prefix; sb];
    % Conversión paralelo a serie / Parallel to serial conversion
    sc=reshape(sbc,1,[]);
    %--------------------------------------------------------------------------
    % Transmission
    %--------------------------------------------------------------------------
    Kd = length(d)-1;
    vc=conv([zeros(1,Kd),sc],d);
    vc=vc(Kd+1:Kd+length(sc));
    vc=vc+sqrt(varNoise/2)*randn(size(vc))+1j*sqrt(varNoise/2)*randn(size(vc));
    %--------------------------------------------------------------------------
    % Demodulation
    %--------------------------------------------------------------------------
    % Serial to parallel
    vpc=reshape(vc,[],nBlocks);
    vp=vpc(C+1:end,:);
    qk=1/sqrt(T)*fft(vp,N,1);
    %--------------------------------------------------------------------------
    % Visualization
    %--------------------------------------------------------------------------
    p=OFDM_p(d,N,C);
    Pe=zeros(1,N);
    for k=1:N
        pk=p{k,k};
        qn=qk(k,:)/pk(1);
        Bke = qamdemod(qn,M,tAssign,'OutputType','bit');
        Ake = qammod(Bke,M,tAssign,'InputType','bit'); 
        %Ake=decisor_qam(qn,M);
        Pe(k)=length(find(Ake~=Ak(k,:)))/length(Ake);
    end
    fprintf('C = %d: Pe (mean) = %.5f\n', C, mean(Pe))
end

%% Section 2.1

a = 9/10;
d = arrayfun(@(m) a^m, 0:5);

disp(' ')
disp('==== Section 2.1 ====')
disp('Error probabilities for varNoise = 0')
varNoise=0;
for C=1:10
    experiment(d, varNoise, C);
end

disp(' ')
disp('Error probabilities for varNoise = 4')
varNoise=4;
for C=1:10
    experiment(d, varNoise, C);
end


%% Section 2.2

disp(' ')
disp('==== Section 2.2 ====')
disp('Error probabilities for varNoise = 4')
varNoise = 4;
C = 5;

Pe = experiment(d, varNoise, C);

for k=1:N
    fprintf('  Pe (k=%d) = %.5f\n', k-1, Pe(k))
    % disp(['  Pe (k=',num2str(k-1),') = ',num2str(Pe(k))])
end
