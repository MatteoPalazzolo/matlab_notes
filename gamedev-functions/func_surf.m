% Intervallo per x, y, z
x_min = -2; x_max = 2;
y_min = -2; y_max = 2;
z_min = 0.1; z_max = 3;

% Genera una griglia di punti
[x, y] = meshgrid(linspace(x_min, x_max, 25), linspace(y_min, y_max, 25));
z = linspace(z_min, z_max, 25); % Discretizzazione di z

% Calcola la funzione f(x, y, z)
[X, Y, Z] = ndgrid(x, y, z); % Griglia 3D per x, y, z
F = sqrt(Z - log(X.^2 + Y.^2)); % Funzione da calcolare

% Visualizza la funzione solo per valori reali
valid = (Z > log(X.^2 + Y.^2)); % Condizione di validità
F(~valid) = NaN; % Rimuove valori non validi

% Plot 3D
figure;
isosurface(X, Y, Z, F, 0.5); % Traccia un isosuperficie della funzione
axis equal;
colormap(jet);
colorbar;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Visualizzazione di f(x, y, z) = \surd(z - log(x^2 + y^2))');

% Miglioramenti
light; % Aggiungi una luce
lighting phong; % Applica un'illuminazione Phong
grid on;
