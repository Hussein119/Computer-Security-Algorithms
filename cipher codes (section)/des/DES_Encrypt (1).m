function Cipher_txt=DES_Encrypt(Plain_txt,Key)
%%  2. key schedule
% define permuted choice 1 (PC1) '65 bit'
PC1 = [57	49	41	33	25	17	9 ...
        1	58	50	42	34	26	18 ...
        10	2	59	51	43	35	27 ...
        19	11	3	60	52	44	36 ...
        63	55	47	39	31	23	15 ...
        7	62	54	46	38	30	22 ... 
        14	6	61	53	45	37	29 ...
        21	13	5	28	20	12	4];
% define permuted choice 2 (PC2)  '48 bit'
PC2=[14 17	11	24	1	5	3	28 ...
     15	6	21	10	23	19	12	4 ...
     26	8	16	7	27	20	13	2 ...
     41	52	31	37	47	55	30	40 ...
     51	45	33	48	44	49	39	56 ...
     34	53	46	42	50	36	29	32];
% define rotations in key-schedule (RK)
% round# 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6
Left_Shift = [1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1];
% pembuatan PC-1 ------------------------------------
PC1=reshape(PC1',1,numel(PC1));
for I=1:length(PC1)
    Key_PC1(I)=Key(PC1(I));%56 bit
end
C(1,:)=Key_PC1(1:28);
D(1,:)=Key_PC1(28+1:56);

% pembuatan Key PC-2 ------------------------------------
PC2=reshape(PC2',1,numel(PC2));
% left shift
for J=1:16
            % circshift(array, num, dim)
             % num: value to shift (positive to right/ - to left)
             % dim:1 shift in row / 2: shift in column
    C(J+1,:)=circshift(C(J,:),-Left_Shift(J),2);  %28 bit
    D(J+1,:)=circshift(D(J,:),-Left_Shift(J),2);  %28 bit    
    Key_LCS=[C(J+1,:) D(J+1,:)]; 
    % apply PC-2
    for I=1:length(PC2) %48 bit
        Key_PC2(I)=Key_LCS(PC2(I));
    end
%     Key_PC2=Key_LCS(PC2);
    Key_Round(J,:)=Key_PC2
    disp('%%%%%%%%%%%%%%%%% keys round  %%%%%%%%%%%%%')
    disp( Key_Round(J,:))
end
%%
%define eight substitution tables
S1 = [14	4	13	1	2	15	11	8	3	10	6	12	5	9	0	7;...
         0  15	7	4	14	2	13	1	10	6	12	11	9	5	3	8;...
         4	1	14	8	13	6	2	11	15	12	9	7	3	10	5	0;...
         15	12	8	2	4	9	1	7	5	11	3	14	10	0	6	13];
S2 = [15	1	8	14	6	11	3	4	9	7	2	13	12	0	5	10;...
    	3	13	4	7	15	2	8	14	12	0	1	10	6	9	11	5;...
		0	14	7	11	10	4	13	1	5	8	12	6	9	3	2	15;...
		13	8	10	1	3	15	4	2	11	6	7	12	0	5	14	9];
S3 = [10	0	9	14	6	3	15	5	1	13	12	7	11	4	2	8;...
		13	7	0	9	3	4	6	10	2	8	5	14	12	11	15	1;...
		13	6	4	9	8	15	3	0	11	1	2	12	5	10	14	7;...
		1	10	13	0	6	9	8	7	4	15	14	3	11	5	2	12];
S4 = [7	13	14	3	0	6	9	10	1	2	8	5	11	12	4	15;...
		13	8	11	5	6	15	0	3	4	7	2	12	1	10	14	9;...
		10	6	9	0	12	11	7	13	15	1	3	14	5	2	8	4;...
		3	15	0	6	10	1	13	8	9	4	5	11	12	7	2	14];
S5 = [2	12	4	1	7	10	11	6	8	5	3	15	13	0	14	9;...
		14	11	2	12	4	7	13	1	5	0	15	10	3	9	8	6;...
		4	2	1	11	10	13	7	8	15	9	12	5	6	3	0	14;...
		11	8	12	7	1	14	2	13	6	15	0	9	10	4	5	3];
S6 = [12	1	10	15	9	2	6	8	0	13	3	4	14	7	5	11;...
		10	15	4	2	7	12	9	5	6	1	13	14	0	11	3	8;...
		9	14	15	5	2	8	12	3	7	0	4	10	1	13	11	6;...
		4	3	2	12	9	5	15	10	11	14	1	7	6	0	8	13];
S7 = [4	11	2	14	15	0	8	13	3	12	9	7	5	10	6	1;...
		13	0	11	7	4	9	1	10	14	3	5	12	2	15	8	6;...
		1	4	11	13	12	3	7	14	10	15	6	8	0	5	9	2;...
		6	11	13	8	1	4	10	7	9	5	0	15	14	2	3	12];
S8 = [13	2	8	4	6	15	11	1	10	9	3	14	5	0	12	7;...
		1	15	13	8	10	3	7	4	12	5	6	11	0	14	9	2;...
		7	11	4	1	9	12	14	2	0	6	10	13	15	3	5	8;...
		2	1	14	7	4	10	8	13	15	12	9	0	3	5	6	11];
  
%define permutation function (PBOX)
PBOX =[16  7 20 21  29 12 28 17 ... 
        1 15 23 26   5 18 31 10 ...
        2  8 24 14  32 27  3  9 ...
        19 13 30  6  22 11  4  25];
    
% define initial permutation (IP)
IP = [58	50	42	34	26	18	10	2 ...
    60	52	44	36	28	20	12	4 ...
    62	54	46	38	30	22	14	6 ...
    64	56	48	40	32	24	16	8 ...
    57	49	41	33	25	17	9	1 ...
    59	51	43	35	27	19	11	3 ...
    61	53	45	37	29	21	13	5 ...
    63	55	47	39	31	23	15	7];

% define Inverse Initial permutation (IIP)
IIP =[40	8	48	16	56	24	64	32 ...
    39	7	47	15	55	23	63	31 ...
    38	6	46	14	54	22	62	30 ...
    37	5	45	13	53	21	61	29 ...
    36	4	44	12	52	20	60	28 ...
    35	3	43	11	51	19	59	27 ...
    34	2	42	10	50	18	58	26 ...
    33	1	41	9	49	17	57	25];
%   Expansion Permutation
Expn=[32  1  2  3  4  5 ...
      4  5  6  7  8  9 ...
      8  9 10 11 12 13 ...
     12 13 14 15 16 17 ...
     16 17 18 19 20 21 ...
     20 21 22 23 24 25 ...
     24 25 26 27 28 29 ...
     28 29 30 31 32  1 ];
%% Step1: Perform Initial Permutation on Plain text
IP=reshape(IP',1,numel(IP));
for I=1:length(IP)
    Plain_txt_IP(I)=Plain_txt(IP(I));
end
%% Step2: Divide Plain_txt_IP into two halves Left and Right
L(1,:)=Plain_txt_IP(1:32);       
R(1,:)=Plain_txt_IP(32+1:64);
%% Step3: Perform 16 Round
Expn=reshape(Expn',1,numel(Expn));
for J=1:16
    % Step1: Perform Expansion/Permutation from Expansion Tabel    
    for I=1:length(Expn)
        R_Expn(I)=R(J,Expn(I));%Generates 48 bit
    end
    %Step2: Perform Xor between Expansion of Rigth half and Key
    R_Expn=xor(R_Expn,Key_Round(J,:));%48 bit
    %Step3: Perform Substitution/Choice S-Box
    K=1; M=1;
    for I=1:8     
        % take 6 bit in each iteration 
        S_Input=R_Expn(K:K+5); % if i=1 so(6:6)
        S_Row_Bin=[S_Input(1) S_Input(6)]; %logical data type
        S_Row_Dec=bin2dec(num2str(S_Row_Bin))
        S_Col_Bin=S_Input(2:5);
        S_Col_Dec=bin2dec(num2str(S_Col_Bin))
        if I==1
            % +1 becouse start count from 1 but should start from 0
            S=S1(S_Row_Dec+1,S_Col_Dec+1) 
        elseif I==2
            S=S2(S_Row_Dec+1,S_Col_Dec+1);
        elseif I==3
            S=S3(S_Row_Dec+1,S_Col_Dec+1);
        elseif I==4
            S=S4(S_Row_Dec+1,S_Col_Dec+1);
        elseif I==5
            S=S5(S_Row_Dec+1,S_Col_Dec+1);
        elseif I==6
            S=S6(S_Row_Dec+1,S_Col_Dec+1);
        elseif I==7
            S=S7(S_Row_Dec+1,S_Col_Dec+1);
        else
            S=S8(S_Row_Dec+1,S_Col_Dec+1); %double
        end
             %store in the same row 1 but for each 4 bit s_out
        S_Out(1,M:M+3)=dec2bin(S,4); 
        % when convert from dec to bin note that  data type is 'string'
        K=K+6; M=M+4;
    end
    %Step4: Perfrom Permutation on the Output of S-Box
    PBOX=reshape(PBOX',1,numel(PBOX));
    for I=1:length(PBOX)
        P_Box(I)=str2num(S_Out(PBOX(I)));
    end
    % Step5: Make the New Left half equals the Right half
    L(J+1,:)=R(J,:);
    % Step6: Perform XOR between the result of Permutation S-Box and Left
    % half of the Plain text to gererate the New Right
    R(J+1,:)=xor(P_Box,L(J,:));
end
%% Step4:Swap the Left and Rigth halves to generate the PreOutput 
Pre_Out=[R(17,:) L(17,:)];
%% Step5: Perform Inverse Initial Permutation
IIP=reshape(IIP',1,numel(IIP));
for I=1:length(IIP)
    Cipher_txt(I)=Pre_Out(IIP(I));
end
end
