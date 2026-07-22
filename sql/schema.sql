-- ============================================================
-- SCRIPT DDL: Estrutura do Banco de Dados de Manutenção
-- SGBD: PostgreSQL
-- ============================================================

-- 1. Tabela: maquinas
CREATE TABLE maquinas (
    maquina_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    modelo VARCHAR(50),
    status VARCHAR(20) NOT NULL
);

-- 2. Tabela: equipe_tecnica
CREATE TABLE equipe_tecnica (
    tecnico_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

-- 3. Tabela Fato: chamados_manutencao
CREATE TABLE chamados_manutencao (
    chamado_id SERIAL PRIMARY KEY,
    maquina_id INT NOT NULL,
    tecnico_id INT NOT NULL,
    tipo_falha VARCHAR(50) NOT NULL,
    status_chamado VARCHAR(20) NOT NULL,
    horas_reparo INT DEFAULT 0,
    CONSTRAINT fk_chamados_maquinas FOREIGN KEY (maquina_id) REFERENCES maquinas (maquina_id) ON DELETE CASCADE,
    CONSTRAINT fk_chamados_equipe FOREIGN KEY (tecnico_id) REFERENCES equipe_tecnica (tecnico_id) ON DELETE RESTRICT
);

-- 4. Tabela: custos_manutencao
CREATE TABLE custos_manutencao (
    custo_id SERIAL PRIMARY KEY,
    chamado_id INT NOT NULL,
    custo_pecas NUMERIC(10, 2) DEFAULT 0.00,
    custo_obra NUMERIC(10, 2) DEFAULT 0.00,
    CONSTRAINT fk_custos_chamados FOREIGN KEY (chamado_id) REFERENCES chamados_manutencao (chamado_id) ON DELETE CASCADE
);
