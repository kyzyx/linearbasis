function [h, negimage] = imshowneg(im)
negimage = repmat(im,1,1,3);
negimage(:,:,1) = negimage(:,:,1).*-(im<0);
negimage(:,:,2) = negimage(:,:,2).*(im>0);
negimage(:,:,3) = zeros(size(im));
h = imshow(negimage);
end
