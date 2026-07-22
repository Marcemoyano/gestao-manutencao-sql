-- ============================================================
-- SCRIPT DML: Carga Inicial e Massa de Dados para Testes
-- SGBD: PostgreSQL
-- ============================================================

-- 1. Inserindo Maquinas
INSERT INTO maquinas (maquina_id, nome, modelo, status) VALUES 
(1, 'Prensa Hidráulica PH-500', 'V2', 'Operacional'),
(2, 'Torno CNC TC-1200', 'Alpha', 'Em Manutenção'),
(3, 'Braço Robótico BR-30', 'Kuka X', 'Operacional');

-- 2. Inserindo Equipe Técnica
INSERT INTO equipe_tecnica (tecnico_id, nome, especialidade) VALUES 
(10, 'Carlos Silva', 'Mecânica'),
(20, 'Ana Santos', 'Elétrica');

-- 3. Inserindo Chamados de Manutenção
INSERT INTO chamados_manutencao (chamado_id, maquina_id, tecnico_id, tipo_falha, status_chamado, horas_reparo) VALUES 
(101, 1, 10, 'Mecânica', 'Concluído', 4),
(102, 2, 20, 'Elétrica', 'Em Andamento', NULL),
(103, 1, 10, 'Mecânica', 'Concluído', 2);

-- 4. Inserindo Custos de Manutenção
INSERT INTO custos_manutencao (custo_id, chamado_id, custo_pecas, custo_obra) VALUES 
(501, 101, 250.00, 400.00),
(502, 103, 50.00, 150.00);
