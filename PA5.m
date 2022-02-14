nx = 50;
ny = 50;

G = sparse(nx*ny,nx*ny);

%x = linspace(0,50);
%dx = x(1)-x(0);
    
for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        
        if i == 1 || i == nx ||j == 1 || j == ny
            G(n, :) = 0;
            G(n, n) = 1;
        else
            G(n, n) = -4;
            G(n, n+1) = 1;
            G(n, n-1) = 1;
            G(n, n+ny) = 1;
            G(n, n-ny) = 1;
        end
    end
end


figure(1) %code used to plot the Eigenvalues
spy(G)
[E, D] = eigs(G, 9, 'SM');

updatedE = zeros(nx, ny, 9);

figure(2) %code used to graph eigenvectors
for m = 1:9
   updatedE(:, :, m) = reshape(E(:, m), nx, ny);
   subplot(3, 3, m)
   surf(updatedE(:, :, m))
end