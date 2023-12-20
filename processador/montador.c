case XCHG_CODE:
    parser_SkipUntil(','); 
    parser_SkipUntilEnd(); 
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


if (strcmp(str_tmp, XCHG_STR) == 0) {
    return XCHG_CODE;
}
