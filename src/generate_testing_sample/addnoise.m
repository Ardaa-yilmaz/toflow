function y = addnoise(I)

h = size(I,1);
w = size(I,2);
y = uint8(zeros(h, w, 3));
I = uint8(int16(I) + int16(random('norm',0,25.5,h,w,3)));
b = uint8(rand(h, w ,3) * 255);
tm = rand(h, w) > 0.1;
m = zeros(h, w, 3);
m(:,:,1) = tm;
m(:,:,2) = tm;
m(:,:,3) = tm;
rm = 1 - m;
y = (I .* uint8(m)) + (b .* uint8(rm));
