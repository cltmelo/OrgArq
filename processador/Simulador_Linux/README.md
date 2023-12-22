# MANUAL

udo isso foi testado em um Ubuntu 11.10  que acabei de instalar...

A) Instalando o Simulador:
	1) Instale o GTK: sudo apt-get install libgtk2.0-dev

	2) Va' na pasta que contem os arquivos do simulador: "simulador_fonte"

	3) Para compilar: sh compila.sh

	4) Copie o executavel (simulador) para a pasta que deseja trabalhar

	5) Confira se tem direito de execucao: [x]

B) Instalando o Montador:
	1) Va' na pasta que contem os arquivos do montador: "montador_fonte"

	2) Para compilar: gcc *.c -o montador

	3) Copie o executavel (montador) para a pasta que deseja trabalhar

	4) Confira se tem direito de execucao: [x]
		ls -l  montador     --> Mostra as permissoes!
		-rw-r--r-- 1 root root 48147 mai 25 08:42 montador    
		--> Da pra ver que nao tem permissao de executar [x]

		sudo chmod +x /montador
		ls -l  montador
		-rrw-r--rwxr-xr-x 1 root root 48147 mai 25 08:42 /bin/montador
		--> rrw-r--rwxr-xr-xAgora incluiu o [x]


C) Montando um Programa em linguagem Assemby (*.ASM):
	1) Para montar o codigo: ./montador seu_programa.asm arquivo.mif

D) Simulando um Programa em linguagem Assemby (*.MIF)
	1) ./sim arquivo.mif charmap.mif
      
## Todos os arquivos estão no diretório ./Simulador_Linux/Teste: Para executar o teste da CPU com a funcao XCHG, abra o terminal e coloque o seguinte código: ./sim cpuram.mif charmap.mif

### Este repositório contém as submissões para implementação do Trabalho 2, A.K.A "Processador", para a disciplina.

# Implementação da Nova instrução para o Processador

Para este trabalho, implementaremos uma função denominada XCHG, que consiste em trocar o conteúdo entre dois registradores de nosso processador. É importante ressaltar que esta instrução possui um caráter ilustrativo e, com os devidos ajustes, poderá ser implementada no Processador-ICMC, visando seu funcionamento eficiente.

Para fins de documentação, enunciarei o passo a passo realizado pelo grupo para essa implementação.

## 1.Modificando a defs.h
Primeiramente, definimos no arquivo defs.h o opcode, o código em binário e a representação em string da nova instrução. Para garantir a eficiência da implementação real, é necessário verificar se o opcode é exclusivo e não entra em conflito com outros já existentes.

### Modificação na defs.h:
    #define XCHG_CODE 99
    #define XCHG "101010"
    #define XCHG_STR "XCHG

## 2. Modificando a montador.c
Para essa modificação temos os seguintes tópicos a ser seguido.
#### 1 - Modificamos a função DetectarLabels para reconhecer a nova instrução e contar os endereços de memória necessários.
#### 2 - Modificamos a função MontarInstrucoes para analisar a instrução e convertê-la em código de máquina.
#### 3 - Modificamos a função BuscaInstrucao para retornar o novo opcode quando a string de instrução for encontrada.

### Abaixo na função 'DetectarLabels', adicionando o caso para 'XCHG_CODE':

### case XCHG_CODE:
    parser_SkipUntil(','); 
    parser_SkipUntilEnd(); 
    end_cnt += 1; 
    break;

### Em 'MontarInstrucoes', também adicionando  um caso para 'XCHG_CODE':
    case XCHG_CODE:
    str_tmp1 = parser_GetItem_s();
    val1 = BuscaRegistrador(str_tmp1);
    free(str_tmp1);
    parser_Match(',');
    str_tmp2 = parser_GetItem_s();
    val2 = BuscaRegistrador(str_tmp2);
    free(str_tmp2);
    str_tmp1 = ConverteRegistrador(val1);
    str_tmp2 = ConverteRegistrador(val2);
    sprintf(str_msg, "%s%s%s0000", XCHG, str_tmp1, str_tmp2);
    parser_Write_Inst(str_msg, end_cnt);
    end_cnt += 1;
    free(str_tmp1);
    free(str_tmp2);
    break;


#### Em 'BuscaInstrucao', retornando a condição 'XCHG_STR':
    if (strcmp(str_tmp, XCHG_STR) == 0) {
    return XCHG_CODE;
    }

## Breakdown da implementação
Para esse tópico será explicado detalhamdamente cada aspecto dessa implementação no Processador.

### 1.Modificação em defs.h

#### a. Definindo o Código de Instrução

#define XCHG_CODE 99
    Esta linha define um identificador exclusivo (opcode) para a instrução XCHG. O número 99 é arbitrário, mas deve ser único e não entrar em conflito com os códigos de operação existentes.

#### b. Definindo a Representação Binária

 #define XCHG "101010"
     Esta linha define a representação binária da instrução XCHG. A string '101010' é um espaço reservado e deve ser projetada de acordo com a arquitetura do conjunto de instruções do processador.

#### c. Definindo a sintaxe da linguagem assembly

#define XCHG_STR "XCHG"
    Esta linha estabelece como a instrução será representada em linguagem assembly. Neste caso, XCHG será o mnemônico utilizado no código assembly.

### 2. Modificação em montador.c
#### a. Análise de instruções e alocação de memória

 Na função DetectarLabels, na instrução switch para op_code, o caso XCHG_CODE é adicionado:
     caso XCHG_CODE:
         Este caso trata da análise da instrução XCHG no código assembly. Garante que o montador reconheça o XCHG e saiba quantos endereços de memória esta instrução irá ocupar.
         As funções parser_SkipUntil(',') e parser_SkipUntilEnd() são usadas para analisar os argumentos da instrução (registros, neste caso) e preparar para a próxima linha do código assembly.
         fim_cnt += 1; indica que a instrução XCHG ocupa um local de memória.

#### b. Montando a Instrução:
 Na função MontarInstrucoes é adicionado mais um caso XCHG_CODE::
    Este caso trata da conversão da instrução assembly XCHG em código de máquina.
    A função BuscaRegistrador(str_tmp1) é utilizada para obter o código numérico do registro a partir de sua representação em string.
    ConverteRegistrador(val1) converte o número do registrador em sua representação binária.
    A função sprintf é usada para concatenar o opcode binário do XCHG com as representações binárias dos dois registradores.
    parser_Write_Inst(str_msg, end_cnt) grava a instrução binária final na saída (o código de máquina).
    fim_cnt += 1; incrementa o contador de instruções, indicando que um local de memória foi usado.

#### c. Conversão de Opcode para Mnemônico:
Na função que converte opcodes em mnemônicos (se tal função existir), um caso para XCHG_CODE deve retornar a string "XCHG".

### Resumo da Instrução XCHG
Operação: Troca o conteúdo de dois registros.
Sintaxe de montagem: XCHG R1, R2
Formato binário: 101010 seguido pelas representações binárias de R1 e R2.
Uso de memória: ocupa um local de memória.
Caso de uso: útil em cenários onde dois valores de registro precisam ser trocados de forma eficiente sem usar instruções adicionais ou armazenamento intermediário.

## Breve explicação final do seu funcionamento:
A instrução XCHG troca o conteúdo de dois registradores. São necessários dois nomes de registradores como argumentos, separados por vírgula. O montador traduz isso em uma única instrução de código de máquina. A representação binária inicia com o opcode XCHG, seguido pelas representações binárias dos dois registradores. A instrução foi projetada para ser executada em um ciclo de máquina (portanto, end_cnt += 1).


As alterações nos arquivos view.cpp, model.cpp, e mnemonicos.h refletem a implementação da instrução XCHG. Aqui estão os detalhes das mudanças:

## 1.Modificando a view.cpp:
	case XCHG: 
        sprintf(texto,"PC: %05d\t|	XCHG R%d, R%d			|	R%d <- R%d ; R%d <- R%d", 						pc, _rx, _ry, _rx, _ry, _ry, _rx);    
    break;


Adiciona uma representação textual para a instrução XCHG no arquivo view.cpp. A mensagem indica que a instrução XCHG está sendo executada e fornece detalhes sobre os registradores envolvidos.
## 1.Modificando a model.cpp:
    case XCHG:
        temp = reg[ry];
        reg[ry] = reg[rx];
        reg[rx] = temp;
        break;

Implementa a instrução XCHG no arquivo model.cpp. A instrução troca os valores dos registradores rx e ry.
## 1.Modificando a Mneumonicos.h
#define XCHG 40


Define o código associado à instrução XCHG. Este código (40 no exemplo) será utilizado internamente para identificar e mapear a instrução XCHG no simulador.

Essas alterações parecem consistentes com a adição da instrução XCHG no simulador, incluindo a representação visual, a lógica do modelo e a identificação única (40) para a instrução.
