function ro = Density_matrix_3level (d12, G21, G32, g12, g23)

ro = zeros(3,3);
roN = zeros(3,3);


roN(1,1) = G21*G32*g12^6 + G32*((G21+G32)*g23^2+G21*(G21^2+2*G32*G21+2*G32^2+d12^2))*g12^4 + (G21^2*g23^4+((G21^2+3*G32*G21+G32^2)*d12^2+G32*(3*G21^3+3*G32*G21^2+2*G32^2*G21+G32^3))*g23^2 + G21*G32*(G21+G32)*((3*G32*G21+G21)*d12^2+G32*(2*G21^2+G32*G21+G32^2)))*g12^2+G21*(G21+G32) + (g23^2+G32*(G21+G32))*(g23^4+2*(G21*G32-d12^2)*g23^2+(G21^2+d12^2)*(G32^2+d12^2));
roN(2,2) = g12^2*(G21*G32*g12^4+G32*((2*G21+G32)*g23^2+2*G21*G32*(G21+G32))*g12^2+(G21+G32) + (g23^2+G32*(G21+G32))*(G32*g23^2+G21*(G32^2+d12^2)));
roN(3,3) = g12^2*g23^2*(G21+G32)*(G21*g12^2+(G21+G32)*(g23^2+G21*G32));
roN(1,2) = 1i*g12*(G21*G32*(G21+1i*d12)*g12^4+G32*((2*G21+G32)*g23^2+2*G21*G32*(G21+G32))*(G21+1i*d12)*g12^2 + G21*(G21+G32)*(g23^2+G32*(G21+G32))*(g23^2+(G21+1i*d12)*(G32+1i*d12))*(G32-1i*d12));
roN(1,3) = g12*g23*(G21*G32*g12^4+((-G21^2+G32*G21+G32^2)*g23^3+G21*G32^3-G21^3*G32)*g12^2 - G21*(G21+G32)*(g23^2+G32*(G21+G32))*(g23^2+(G21+1i*d12)*(G32+1i*d12)));
roN(2,3) = 1i*g12^2*g23*(G21+G32)*(G21*G32*g12^2+G32*(G21+G32)*(g23^2+G21*G32) + 1i*G21*(g23^2+G32*(G21+G32))*d12);

D = 2*G21*G32*g12^6+((G21^2+4*G32*G21+2*G32^2)*g23^2+G21*G32*((G21+2*G32)^2+d12^2))*g12^4 + ((2*G21^2+3*G32*G21+2*G32^2)*g23^4+((2*G21^2+4*G32*G21+G32^2)*d12^2+G32*(4*G21^3+7*G32*G21^2+6*G32^2*G21+2*G32^3))*g23^2+2*G21*G32*(G21+G32)*((G21+2*G32)*d12^2+G32*(G21^2+G32*G21+G32^2)))*g12^2+G21*(G21+G32)*(g23^2+G32*(G21+G32))*(g23^4+2*(G21*G32-d12^2)*g23^2+(G21^2+d12^2)*(G32^2+d12^2));

ro(1,1) = roN(1,1)/D;
ro(2,2) = roN(2,2)/D;
ro(3,3) = roN(3,3)/D;
ro(1,2) = roN(1,2)/D;
ro(1,3) = roN(1,3)/D;
ro(2,3) = roN(2,3)/D;
ro(2,1) = conj(roN(1,2)/D);
ro(3,1) = conj(roN(1,3)/D);
ro(3,2) = conj(roN(2,3)/D);

end
