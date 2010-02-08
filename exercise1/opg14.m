%% Read Image
RGB = im2double (imread ('kande1.JPG'));

%% Define training and test regions
tll = [328, 150]; % training: lower left
tur = [264, 330]; % training: upper right
ell1 = [235, 200]; % test: lower left
eur1 = [155, 240]; % test: upper right
ell2 = [530, 200]; % test: lower left
eur2 = [436, 240]; % test: upper right

%% Show image and regions
imshow (RGB);
hold on
  plot ([tur(2), tll(2), tll(2), tur(2), tur(2)], ...
        [tur(1), tur(1), tll(1), tll(1), tur(1)], ...
        'k-', 'linewidth', 2);
  text (tll(2), tur(1)-15, 'Training');

  plot ([eur1(2), ell1(2), ell1(2), eur1(2), eur1(2)], ...
        [eur1(1), eur1(1), ell1(1), ell1(1), eur1(1)], ...
        'g-', 'linewidth', 2);
  text (ell1(2), ell1(1)+15, 'Test 1', 'color', 'g');

  plot ([eur2(2), ell2(2), ell2(2), eur2(2), eur2(2)], ...
        [eur2(1), eur2(1), ell2(1), ell2(1), eur2(1)], ...
        'g-', 'linewidth', 2);
  text (ell2(2), ell2(1)+15, 'Test 2', 'color', 'g');
hold off

%% Extract regions
training_data = RGB (tur(1):tll(1), tll(2):tur(2), :);
training_data = reshape (training_data, size (training_data, 1) * size (training_data, 2), 3);

test_data1 = RGB (eur1(1):ell1(1), ell1(2):eur1(2), :);
test_data1 = reshape (test_data1, size (test_data1, 1) * size (test_data1, 2), 3);
test_data2 = RGB (eur2(1):ell2(1), ell2(2):eur2(2), :);
test_data2 = reshape (test_data2, size (test_data2, 1) * size (test_data2, 2), 3);

test_data = [test_data1; test_data2];

