SELECT e.cpf, e.enome, d.dnome
FROM empregados e
LEFT JOIN trabalha t ON e.cpf = t.cpf_emp
LEFT JOIN departamentos d ON e.dnumero = d.dnumero
WHERE t.pnumero IS NULL
ORDER BY e.cpf;