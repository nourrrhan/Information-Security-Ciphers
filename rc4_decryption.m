function plain = rc4_decryption(cipher, key)

% initialize S and T and convert key to ascii code
key = double(key);
for i = 1: 256
    S(i) = i - 1;
    T(i) = key(mod(i - 1, length(key)) + 1);
end


% initial permutation of S
j = 0;
for i = 1: 256
    j = mod(j + S(i) + T(i), 256);

    % swap s(i), s(j + 1)
    temp = S(i);
    S(i) = S(j + 1);
    S(j + 1) = temp;
end


% key generation and decryption
plain = zeros(size(cipher));
i = 0;
j = 0;

for k = 1: length(cipher)
    % stream generation
    i = mod(i + 1, 256);
    j = mod(j + S(i + 1), 256);

    % swap
    temp = S(i + 1);
    S(i + 1) = S(j + 1);
    S(j + 1) = temp;

    % key generation
    t = mod(S(i + 1) + S(j + 1), 256);

    % decryption
    plain(k) = bitxor(double(cipher(k)), S(t+1));
end

% convert to chars
plain = char(plain);

end


%test
%rc4_decryption('S¾pí¡É@§ß', 'secret')
%'hello world'
