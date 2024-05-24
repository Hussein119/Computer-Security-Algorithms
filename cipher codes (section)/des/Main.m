
plain_txt=dec2bin([0 2 4 6 8 10 12 14 14 12 10 8 6 4 2 0],4);
plain_txt=reshape(plain_txt',1,64);
Plain=zeros(1,64);
for I=1:64
    Plain(I)=str2double(plain_txt(I));
end
Key=dec2bin([0 15 1 5 7 1 12 9 4 7 13 9 14 8 5 9],4);
Key=reshape(Key',1,64);
K=zeros(1,64);
for I=1:64
    K(I)=str2double(Key(I));
end
Cipher_Bin=DES_Encrypt(Plain,K);

J=1;
for I=1:4:64
    Cipher_Dec(J)=bin2dec(num2str(Cipher_Bin(I:I+3)));
    J=J+1;
end
disp('%%%%%%%%%%%%%%%%%%Cipher_text%%%%%%%%%%%%%%%%%%%%%%%')
disp(Cipher_Dec)
disp('%%%%%%%%%%%%%%%%%%Plain_text%%%%%%%%%%%%%%%%%%%%%%%')
Plain_Bin=DES_Decrypt(Cipher_Bin,K);

J=1;
for I=1:4:64
    Plain_Dec(J)=bin2dec(num2str(Plain_Bin(I:I+3)));
    J=J+1;
end
disp(Plain_Dec)