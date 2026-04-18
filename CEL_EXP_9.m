a = -2;
b = 4;

%Analytical

% F(x) = x - x^2/2 - x^4 + x^6/3

Fa = a - (a^2)/2 - (a^4) + (a^6)/3;
Fb = b - (b^2)/2 - (b^4) + (b^6)/3;

I1 = Fb - Fa;

%trapazoidal 

fa = 1 - a - 4*a^3 + 2*a^5;
fb = 1 - b - 4*b^3 + 2*b^5;

I2 = ((b - a)/2) * (fa + fb);

% composite trapazoidal

n_values = [2 4];

for k = 1:length(n_values)
    
    n = n_values(k);
    h = (b - a)/n;
    
    sum = 0;
    
    for i = 1:n-1
        xi = a + i*h;
        fi = 1 - xi - 4*xi^3 + 2*xi^5;
        sum = sum + fi;
    end
    
    f0 = 1 - a - 4*a^3 + 2*a^5;
    fn = 1 - b - 4*b^3 + 2*b^5;
    
    I_trap(k) = (h/2) * (f0 + 2*sum + fn);
end

I3 = I_trap(1); % n = 2
I4 = I_trap(2); % n = 4

%simpson 1/3

h = (b - a)/2;
x1 = (a + b)/2;

f0 = 1 - a - 4*a^3 + 2*a^5;
f1 = 1 - x1 - 4*x1^3 + 2*x1^5;
f2 = 1 - b - 4*b^3 + 2*b^5;

I5 = (h/3) * (f0 + 4*f1 + f2);

%simpson 3/8

n = 3;
h = (b - a)/n;

sum = 0;

for i = 1:n-1
    xi = a + i*h;
    fi = 1 - xi - 4*xi^3 + 2*xi^5;
    sum = sum + 3*fi;
end

f0 = 1 - a - 4*a^3 + 2*a^5;
fn = 1 - b - 4*b^3 + 2*b^5;

I6 = (3*h/8) * (f0 + sum + fn);

fprintf('Analytical   = %.2f\n', I1);
fprintf('Trap single  = %.2f\n', I2);
fprintf('Trap n=2     = %.2f\n', I3);
fprintf('Trap n=4     = %.2f\n', I4);
fprintf('Simpson 1/3  = %.2f\n', I5);
fprintf('Simpson 3/8  = %.2f\n', I6);