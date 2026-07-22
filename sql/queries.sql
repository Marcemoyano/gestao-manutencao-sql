-- ================================================
-- SCRIPT DQL: Consultas Analíticas 
-- Projeto: Gestão de Manutenção Industrial (OEE)
-- ================================================


-- 1. DISPONIBILIDADE (OEE): Downtime Total por Equipamento
-- Objetivo: Identificar o tempo total de parada não planejada (horas)
-- em cada máquina para cálculo do índice de Disponibilidade.

SELECT 
    m.nome AS maquina,
    m.modelo,
    m.status AS status_atual,
    COUNT(c.chamado_id) AS total_chamados,
    COALESCE(SUM(c.horas_reparo), 0) AS total_horas_parada
FROM maquinas m
LEFT JOIN chamados_manutencao c ON m.maquina_id = c.maquina_id
GROUP BY m.maquina_id, m.nome, m.modelo, m.status
ORDER BY total_horas_parada DESC;


-- 2. ANÁLISE DE CAUSA RAIZ: Pareto de Falhas por Tipo
-- Objetivo: Mapear os tipos de falhas mais recorrentes e o seu
-- impacto acumulado em horas de máquina parada.

SELECT 
    c.tipo_falha,
    COUNT(c.chamado_id) AS total_ocorrencias,
    COALESCE(SUM(c.horas_reparo), 0) AS total_horas_impactadas
FROM chamados_manutencao c
GROUP BY c.tipo_falha
ORDER BY total_ocorrencias DESC, total_horas_impactadas DESC;


-- 3. DESEMPENHO TÉCNICO: Carga de Trabalho e Horas Trabalhadas
-- Objetivo: Avaliar a distribuição de chamados por especialista e 
-- o tempo total dedicado às manutenções concluídas ou em andamento.

SELECT 
    t.nome AS tecnico,
    t.especialidade,
    COUNT(c.chamado_id) AS chamados_atendidos,
    COALESCE(SUM(c.horas_reparo), 0) AS total_horas_trabalhadas
FROM equipe_tecnica t
LEFT JOIN chamados_manutencao c ON t.tecnico_id = c.tecnico_id
GROUP BY t.tecnico_id, t.nome, t.especialidade
ORDER BY total_horas_trabalhadas DESC;

