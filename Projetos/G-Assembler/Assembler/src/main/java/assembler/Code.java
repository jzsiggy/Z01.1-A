/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        if (mnemnonic[0] != "movw"){
            switch (mnemnonic[mnemnonic.length -1]) {
                case "%A"  : return "0001";
                case "%D"  : return "0010";
                case "(%A)": return "0100";
                default    : return "0000";
            }
        }

        else{
            if (mnemnonic.length > 3) {
                switch (mnemnonic[mnemnonic.length -1]){
                    case "%A":
                        if(mnemnonic[mnemnonic.length -2] == "(%A)"){
                            return "0101";
                        } else if (mnemnonic[mnemnonic.length -2] == "%D"){
                            return "0011";
                        } else {
                            return "0000";
                        }
                    case "%D":
                        if(mnemnonic[mnemnonic.length -2] == "(%A)"){
                            return "0110";
                        } else if(mnemnonic[mnemnonic.length -2] == "%A"){
                            return "0111";
                        } else{
                            return "0000";
                        }
                    case "(%A)":
                        if(mnemnonic[mnemnonic.length -2] == "%A"){
                            return "0101";
                        } else if (mnemnonic[mnemnonic.length -2] == "%D"){
                            return "0110";
                        } else{
                            return "0000";
                        }
                }
            }
            else{
                switch (mnemnonic[mnemnonic.length -1]) {
                    case "%A"  : return "0001";
                    case "%D"  : return "0010";
                    case "(%A)": return "0100";
                    default    : return "0000";
                }
            }
            return "0000";
        }
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        if (mnemnonic.length == 2){
            if (mnemnonic[1] == "%A"){
                switch (mnemnonic[0]) {
                    case "incw": return "000110111";
                    case "decw": return "000110010";
                    case "notw": return "000110001";
                    case "negw": return "000110011";
                }
            } else if (mnemnonic[1] == "%D"){
                switch (mnemnonic[0]){
                    case "incw": return "000011111";
                    case "decw": return "000001110";
                    case "notw": return "000001101";
                    case "negw": return "000001111";
                }
            } else if(mnemnonic[1] == "(%A)"){
                switch (mnemnonic[0]){
                    case "incw": return "001110111";
                }
            }
            }else if(mnemnonic[0] == "movw"){
            switch (mnemnonic[1]){
                case "%A"  : return "000110000";
                case "%D"  : return "000001100";
                case "(%A)": return "001110000";
                default    : return "000000000";
            }
        }else if(mnemnonic[0] == "andw"){
            if (mnemnonic[1] == "%D"){
                return "000000000";
            }else if (mnemnonic[1] == "(%A)"){
                return "001000000";
            } else {
                return "000000000";
            }
        }else if(mnemnonic[0] == "orw"){
            if (mnemnonic[1] == "%D"){
                return "000010101";
            }else if (mnemnonic[1] == "(%A)"){
                return "001010101";
            }else{
                return "000000000";
            }
        }else if(mnemnonic[0] == "subw"){
            if (mnemnonic[1] == "%A" && mnemnonic[2] == "$1"){
                return "000110010";
            } else if (mnemnonic[1] == "(%A)" && mnemnonic[2] == "$1"){
                return "001110010";
            }else if (mnemnonic[1] == "%A"){
                return "000000111";
            } else if (mnemnonic[1] == "(%A)"){
                return "001000111";
            } else if (mnemnonic[2] == "%A"){
                return "000010011";
            } else if (mnemnonic[2] == "(%A)"){
                return "001010011";
            } else {
                return "000000000";
            }
        }else if(mnemnonic[0] == "rsubw"){
            if (mnemnonic[2] == "%A" && mnemnonic[1] == "$1"){
                return "000110010";
            } else if (mnemnonic[2] == "(%A)" && mnemnonic[1] == "$1"){
                return "001110010";
            } else if (mnemnonic[1] == "(%A)"){
                return "001010011";
            }else if (mnemnonic[2] == "%A"){
                return "000000111";
            } else if (mnemnonic[2] == "(%A)"){
                return "001000111";
            } else if (mnemnonic[1] == "%A"){
                return "000010011";
            } else {
                return "000000000";
            }
        }else if(mnemnonic[0] == "addw"){
            if (mnemnonic[1] == "$1" && mnemnonic[2] == "%A"){
                return "000110111";
            } else if (mnemnonic[1] == "%A" && mnemnonic[2] == "$1"){
                return "000110111";
            } else if (mnemnonic[1] == "$1" && mnemnonic[2] == "(%A)"){
                return "001110111";
            } else if (mnemnonic[1] == "(%A)" && mnemnonic[2] == "$1"){
                return "001110111";
            } else if (mnemnonic[1] == "%A"){
                return "000000010";
            } else if (mnemnonic[1] == "(%A)"){
                return "001000010";
            }else if (mnemnonic[2] == "%A"){
                return "000000010";
            } else if (mnemnonic[2] == "(%A)"){
                return "001000010";
            } else {
                return "000000000";
            }
        }

        else{
            switch (mnemnonic[0]){
            case "jmp" :
            case "jge" :
            case "jg"  :
            case "je"  :
            case "jne" :
            case "jl"  :
            case "jle" :
                return "000001100";
        }
    }
        return "000000000";
    }



    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {
        switch (mnemnonic[0]){
            case "jmp"  : return "111";
            case "jg"   : return "001";
            case "jge"  : return "011";
            case "je"   : return "010";
            case "jne"  : return "101";
            case "jl"   : return "100";
            case "jle"  : return "110";
            default     : return "000";
        }    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {
        int valor = Integer.valueOf(symbol);
        String binario = Integer.toBinaryString(valor);
        return String.format("%1$16s", binario).replace(" ", "0");
    }
}
