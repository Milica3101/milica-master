load T_data_matrix_input.mat
funList={@(x)x.^(1/3), @(x)-sqrt(max(x)-x), @(x)x.^(1/3), @(x)x, @(x)log(x), @(x)x.^2, @(x)x.^(1/3), @(x)log(x), @(x)x.^(1/3), @(x)-sqrt(max(x)-x), @(x)log(x-min(x)), @(x)log(x-min(x)), @(x)(x-min(x)).^(1/3), @(x)(x-min(x)).^(1/3), @(x)sqrt(x-min(x)), @(x)-(max(x)-x).^(1/3), @(x)x, @(x)log(x)}
for i=1:width(T_data_matrix_input)
    T_data_matrix_input{:,i}=funList{i}(T_data_matrix_input{:,i});
end
disp(T_data_matrix_input)

idx=isoutlier(T_data_matrix_input);
medijane=median(T_data_matrix_input,'omitmissing')

T_transformed=filloutliers(T_data_matrix_input,"center",'median') %% nisam sigurna da li moze ova funkcija da se koristi i sta je tacno ovaj fillmethod