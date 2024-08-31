CREATE TABLE Produto (
Id_Produto INT UNIQUE AUTO_INCREMENT NOT NULL,
    Nome_Produto VARCHAR (150) NOT NULL,
    Codigo_Barra VARCHAR (50) NOT NULL,
    Valor_Produto DECIMAL (10,2) unsigned NOT NULL,
    Categoria SMALLINT NOT NULL,
    Descricao_Produto VARCHAR (100) NOT NULL
);

CREATE TABLE Categoria_Produto (
Id_Categoria SMALLINT UNIQUE AUTO_INCREMENT NOT NULL,
    Categoria VARCHAR (75) NOT NULL,
    Sub_Categoria VARCHAR (50) NOT NULL
);

CREATE TABLE Estoque (
Id_Estoque INT UNIQUE AUTO_INCREMENT NOT NULL,
    Id_Produto INT NOT NULL,
    Quantidade INT NOT NULL,
    Data_Validade DATE,
    Data_Solicitacao DATE NOT NULL,
    Data_Entrada DATE,
    Custo DECIMAL (10,2) UNSIGNED NOT NULL,
    Id_Fornecedor INT NOT NULL,
    Status_estoque ENUM('Disponivel', 'Esgotado', 'Em Reposição') DEFAULT ('Em Reposição') NOT NULL
);

CREATE TABLE Venda (
Id_Venda INT UNIQUE AUTO_INCREMENT NOT NULL,
    Dia DATE NOT NULL,
    Hora TIME NOT NULL,
    Valor_Venda DECIMAL (10,2) UNSIGNED NOT NULL,
    Forma_Pagamento SMALLINT NOT NULL,
    Parcelas TINYINT NOT NULL,
    Observacoes VARCHAR (100),
    Id_Vendedor INT NOT NULL,
    Id_Cliente INT,
    CPF_Cliente VARCHAR (20),
    Status_Venda ENUM('Pendente', 'Concluída', 'Cancelada', 'Em Andamento') DEFAULT ('Pendente')  NOT NULL
);

CREATE TABLE Forma_Pagamento (
Id_Pagamento SMALLINT UNIQUE AUTO_INCREMENT NOT NULL,
    Tipo VARCHAR (50) NOT NULL UNIQUE
);

CREATE TABLE Venda_Item (
Id_Item_Venda INT UNIQUE AUTO_INCREMENT NOT NULL,
    Venda_Id INT NOT NULL,
    Produto_Id INT NOT NULL,
    Quantidade INT NOT NULL,
    Valor_Item DECIMAL (10,2) UNSIGNED NOT NULL
);

CREATE TABLE Fornecedores (
Id_Fornecedor INT UNIQUE AUTO_INCREMENT NOT NULL,
    Nome_Fornecedor VARCHAR (150) NOT NULL,
    Tipo_Comercio SMALLINT (50) NOT NULL,
    Telefone VARCHAR (20),
    Rua VARCHAR (200) NOT NULL,
    Bairro VARCHAR (50) NOT NULL,
    Estado VARCHAR (40) NOT NULL,
    Pais VARCHAR (50) NOT NULL DEFAULT ('Brasil'),
    Responsavel VARCHAR (50) NOT NULL,
    Documento VARCHAR (50) NOT NULL,
    Status_Fornecedor ENUM('Ativo', 'Inativo', 'Suspenso', 'Em Avaliação') DEFAULT 'Ativo' NOT NULL
);  

CREATE TABLE Tipo_Comercio (
Id_Comercio SMALLINT UNIQUE AUTO_INCREMENT NOT NULL,
    Tipo VARCHAR (100) NOT NULL
);

CREATE TABLE Metas (
Id_Meta INT AUTO_INCREMENT UNIQUE NOT NULL,
Id_Gerente INT NOT NULL,
    Valor_Meta DECIMAL (10,2) UNSIGNED NOT NULL,
    Bonificacao DECIMAL (10,2) UNSIGNED NOT NULL,
    Id_Vendedor INT NOT NULL,
    Id_Caixa SMALLINT,
    Data_Inicio DATE NOT NULL,
    Data_Final DATE NOT NULL,
    Status_Meta ENUM('Não Iniciada', 'Em andamento', 'Concluida', 'Atrasada', 'Cancelada') DEFAULT ('Não Iniciada') NOT NULL,
    Valor_Venda DECIMAL(10,2) UNSIGNED DEFAULT 0.00 NOT NULL
);

CREATE TABLE Ofertas (
Id_Oferta INT AUTO_INCREMENT UNIQUE NOT NULL,
    Id_Gerente INT NOT NULL,
    Id_Produto INT NOT NULL,
    Desconto INT NOT NULL,
    Qtde_Minima TINYINT DEFAULT 0 NOT NULL,
    Data_Inicio DATE NOT NULL,
    Status_Oferta ENUM('Ativa', 'Inativa', 'Expirada', 'Suspensa') DEFAULT 'Inativa' NOT NULL
);

CREATE TABLE Cliente (
Id_Cliente INT AUTO_INCREMENT UNIQUE NOT NULL,
    Nome VARCHAR (100) NOT NULL,
    Sobrenome VARCHAR (150) NOT NULL,
    CPF VARCHAR (20) UNIQUE NOT NULL,
    CEP VARCHAR (15) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Telefone VARCHAR (20) NOT NULL
);

CREATE TABLE Compra (
Id_Compra INT AUTO_INCREMENT UNIQUE NOT NULL,
Valor_Unitario DECIMAL (10,2) UNSIGNED NOT NULL,
    Unidade_Medida VARCHAR (50) NOT NULL,
    Valor_Total DECIMAL (10,2) UNSIGNED NOT NULL,
    Qtde_Total INT NOT NULL,
    Id_Fornecedor INT NOT NULL,
    Previsao_Entrega DATE NOT NULL,
    Status_Entrega ENUM('Pendente', 'Em Transito', 'Concluída', 'Cancelada') DEFAULT 'Pendente' NOT NULL
);

CREATE TABLE Empresa (
Id_Empresa INT UNIQUE NOT NULL DEFAULT 1,
Razao_Social VARCHAR (200) UNIQUE NOT NULL,
    CNPJ VARCHAR (50) UNIQUE NOT NULL,
    Rua VARCHAR (200) NOT NULL,
    Bairro VARCHAR (50) NOT NULL,
    Estado VARCHAR (50) NOT NULL,
    Pais VARCHAR (50) NOT NULL DEFAULT ('Brasil'),
    Telefone VARCHAR (20) NOT NULL
);

CREATE TABLE Ponto_Funcionarios (
Id_Ponto INT AUTO_INCREMENT UNIQUE NOT NULL,
    Data_ DATE NOT NULL,
    Id_Funcionario INT NOT NULL,
    Horario_Entrada TIME NOT NULL,
    Horario_Saida TIME NOT NULL,
    Tempo_Atraso TIME,
    Hora_Extra TIME
);

CREATE TABLE Contrato_Funcionario (
Id_Contrato INT UNIQUE AUTO_INCREMENT NOT NULL,
    Id_Funcionario INT NOT NULL,
    Cargo SMALLINT NOT NULL,
    Data_Inicio DATE NOT NULL,
Data_Fim DATE NOT NULL,
    Carga_Horaria_Semanal TIME NOT NULL,
    Tipo_Contrato SMALLINT NOT NULL,
    Salario_Base DECIMAL (10,2) UNSIGNED NOT NULL,
    Beneficios VARCHAR (150) NOT NULL
);

CREATE TABLE Tipo_Contrato (
Id_Tipo SMALLINT UNIQUE AUTO_INCREMENT NOT NULL,
    Tipo ENUM('Padrão','Temporário','Por Projeto','Confidencial','CLT','PJ','Jovem Aprendiz','Estágio') NOT NULL
);

CREATE TABLE Holerite (
Id_Holerite INT UNIQUE AUTO_INCREMENT NOT NULL,
    Id_Contrato INT NOT NULL,
    Mes_Referencia TINYINT NOT NULL,
    Salario_Bruto DECIMAL (10,2) UNSIGNED NOT NULL,
    Descontos DECIMAL (10,2) UNSIGNED,
    Salario_Liquido DECIMAL (10,2) UNSIGNED NOT NULL
);
 
CREATE TABLE Funcionarios (
Id_Funcionario INT UNIQUE AUTO_INCREMENT NOT NULL,
Nome varchar (100) NOT NULL,
    Sobrenome VARCHAR (150) NOT NULL,
CPF VARCHAR (20) UNIQUE NOT NULL,
Cargo SMALLINT NOT NULL,
    Setor SMALLINT,
    Situacao ENUM('Ativo', 'Inativo', 'Desligado', 'Afastado', 'Suspenso') DEFAULT 'Ativo' NOT NULL,
    Email VARCHAR (200)
);

CREATE TABLE Cargo_Funcionarios (
Id_Cargo SMALLINT UNIQUE AUTO_INCREMENT NOT NULL,
Cargo ENUM('Gerente', 'Vendedor', 'Caixa', 'Estoquista', 'Assistente', 'Supervisor', 'Assistente Administrativo','Administrador') NOT NULL
);

CREATE TABLE Setor_Funcionario (
Id_Setor INT UNIQUE NOT NULL,
    Setor ENUM('Vendas', 'Financeiro', 'Estoques', 'Administração', 'Marketing', 'Recursos Humanos', 'Logística') NOT NULL
);

CREATE TABLE Usuario_Interno (
Id_Usuario INT UNIQUE AUTO_INCREMENT NOT NULL,
    Nome VARCHAR (100) NOT NULL,
    Sobrenome VARCHAR (150) NOT NULL,
    Email VARCHAR (200) NOT NULL,
    Senha VARCHAR (30) NOT NULL,
    Situacao_Conta ENUM('Ativo', 'Inativo', 'Suspenso') NOT NULL,
    Grupo SMALLINT NOT NULL,
    Id_Funcionario INT NOT NULL
);

CREATE TABLE Grupo_Usuario (
Id_Grupo SMALLINT UNIQUE AUTO_INCREMENT NOT NULL,
    Grupo ENUM('Administrador','Gerente','Supervisor','Funcionário','Estagiário') NOT NULL
);

CREATE TABLE Controle_Acesso_Usuario (
Id_Log BIGINT AUTO_INCREMENT NOT NULL,
Id_Usuario INT NOT NULL,
    Horario_Login DATETIME NOT NULL,
Horario_Logoff DATETIME NOT NULL
); 
