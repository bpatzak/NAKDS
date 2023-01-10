function [Kww, Kwf, Kff] = beam_stiffness(kGA, EI, l)

    Kww = kGA/l*[1 -1; -1 1];
    Kwf = kGA*[-1/2 -1/2; 1/2 1/2];
    Kff = EI/l*[1 -1; -1 1] + kGA*[l/3 l/6; l/6 l/3];

end
