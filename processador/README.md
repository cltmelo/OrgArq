# Universisdade de São Paulo - São Carlos
## Organização e Arquitetura de Computadores
  - Ambiente colaborativo de desenvolvimento às atividade da disciplina *SCC0902 - Organização e Aquitetura de Computadores*
  - Componetes do grupo:
      - Lucas Corlete Alves de Melo - nusp: 136676461
      - Jean Carlos Pereira CAssiano - nusp: 138640008
      - João Victor de Almeida - nusp: 13695424
  - Professor:
      - Eduardo do Valle Simões
      

### Este repositório contém as submissões para implementação do Trabalho 2, A.K.A "Processador", para a disciplina.

# Implementação da Nova instrução para o Processador

Para esse trabalho iremos implementar um função denominada XCHG, que consiste em trocar conteúdo entre dois registradores de nosso processador. É importante que essa instrução tem uma óptica ilustrativa e com devidos ajustes podendo implementado no Processador-ICMC, pois precisa fazer os devidos ajustes,se necessario para que esteja de forma eficiente implementado no processador.

Para fins de documentação irei enunciar o passo a passo realizado pelo grupo para essa implementação.

## 1.Modificando a defs.h
Primeiramente foi definido na defs.h o opcode, o códgo em binário e a representação em String da nova representação. Para uma melhor eficiencia da implementação real seria necessario verificar se o "opcode" seja exclusivo e não entre em conflito com outros existentes

### Modificação na defs.h


#define XCHG_CODE 99


#define XCHG "101010"


#define XCHG_STR "XCHG"

## 2. Modificando a montador.c
Para essa modificação temos os seguintes tópicos a ser seguido.
1 - Modificamos a função DetectarLabels para reconhecer a nova instrução e contar os endereços de memória necessários.
2 - Modificamos a função MontarInstrucoes para analisar a instrução e convertê-la em código de máquina.
3 - Modificamos a função BuscaInstrucao para retornar o novo opcode quando a string de instrução for encontrada.

### Abaixo na função 'DetectarLabels', adicionando o caso para 'XCHG_CODE':

case XCHG_CODE:
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


Em 'BuscaInstrucao', retornando a condição 'XCHG_STR':
    if (strcmp(str_tmp, XCHG_STR) == 0) {
    return XCHG_CODE;
}

## Breakdown da implementação
Para esse tópico irei explicar detalhamdamente cada aspecto dessa implementação no Processador.
1.Modification in defs.h
    a. Defining the Instruction Code

        #define XCHG_CODE 99
            This line defines a unique identifier (opcode) for the XCHG instruction. The number 99 is arbitrary but should be unique and not conflict with existing opcodes.

    b. Defining the Binary Representation

        #define XCHG "101010"
            This line defines the binary representation of the XCHG instruction. The string "101010" is a placeholder and should be designed according to the instruction set architecture of the processor.

    c. Defining the Assembly Language Syntax

        #define XCHG_STR "XCHG"
            This line defines how the instruction will be represented in assembly language. In this case, XCHG will be the mnemonic used in the assembly code.

## Breve explicação final do seu funcionamento:
A instrução XCHG troca o conteúdo de dois registradores. São necessários dois nomes de registro como argumentos, separados por vírgula. O montador traduz isso em uma única instrução de código de máquina. A representação binária começa com o opcode XCHG seguido pelas representações binárias dos dois registradores. A instrução foi projetada para ser executada em um ciclo de máquina (portanto, end_cnt += 1).




