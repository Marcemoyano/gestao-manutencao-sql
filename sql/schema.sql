-- ============================================================
-- SCRIPT DDL: Estrutura do Banco de Dados de Manutenção
-- SGBD: PostgreSQL
-- ============================================================

-- 1. Tabela de Máquinas
CREATE TABLE maquinas (
    maquina_id INT PRIMARY KEY,
    nome VARCHAR(100),
    modelo VARCHAR(50),
    status VARCHAR(20)
);

-- 2. Tabela da Equipe Técnica
CREATE TABLE equipe_tecnica (
    tecnico_id INT PRIMARY KEY,
    nome VARCHAR(100),
    especialidade VARCHAR(50)
);

-- 3. Tabela de Chamados de Manutenção
CREATE TABLE chamados_manutencao (
    chamado_id INT PRIMARY KEY,
    maquina_id INT,
    tecnico_id INT,
    tipo_falha VARCHAR(50),
    status_chamado VARCHAR(20),
    horas_reparo INT
);

-- 4. Tabela de Custos
CREATE TABLE custos_manutencao (
    custo_id INT PRIMARY KEY,
    chamado_id INT,
    custo_pecas DECIMAL(10, 2),
    custo_obra DECIMAL(10, 2)
);
