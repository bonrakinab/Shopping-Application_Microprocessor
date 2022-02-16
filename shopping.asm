.MODEL SMALL
.STACK 100H
.DATA       



INTRO DB '*************************SHOPPING MANAGEMENT SYSTEM*****************************$',10,13
INTRO2 DB '         ****************        MICROPROCESSOR PROJECT     *************** $',10,13
                              

ENTER DB 10,13,'PLEASE ENTER THE KEYS WHAT YOU WANT TO BUY: $'

INFO DB 10,13,'KEYS         ITEMS               PRICE$'

CS_MALE DB 10,13,' 1    CASUAL SHIRT(MALE)        150 USD $'
                        
FS_MALE DB 10,13,' 2    FORMAL SHIRT(MALE)        140 USD $'
                     
PANT_MALE DB 10,13,' 3    PANT (MALE)               210 USD $'

M_SHOES DB 10,13,' 4    MALE SHOES                350 USD $'

CS_FEMALE DB 10,13,' 5    CASUAL SHIRT(FEMALE)      140 USD $'

PANT_FEMALE DB 10,13,' 6    PANT (FEMALE)             220 USD $'

F_SHOES DB 10,13,' 7    FEMALE SHOES              310 USD $'

PANJABI DB 10,13,' 8    PANJABI                   180 USD $'

KURTI DB 10,13,' 9    KURTI                     225 USD $'

E_QUANTITY DB 10,13,'ENTER QUANTITY: $'

AGAIN DB 10,13,'DO YOU WANT TO BUY MORE? (1.YES || 2.NO): $'

ER_MSG DB 10,13,'ERROR INPUT$'  

CHOICE DB 10,13,'ENTER YOUR CHOICE:$'    

FT DB 10,13,'TOTAL AMOUNT IS :$' 
 
ERR DB 0DH,0AH,'WRONG INPUT! START FROM THE BEGINNING $'   

ERR2 DB 0DH,0AH,'WRONG INPUT.PRESS Y/Y OR N/N $' 

R DB 0DH,0AH,'PRESENT AMOUNT IS : $' 

E_DISCOUNT DB 10,13,'ENTER DISCOUNT(IF NOT AVAILABLE ENTER 0 ): $' 

ERASK DB 10,13,'START FROM THE BEGINNING $'

EN_DIS DB 10,13,'AGAIN ENTER DISCOUNT: $'

A DW ?                           
B DW ?
C DW ?
S DW 0,'$'
                                 
NL DB 0DH,0AH,'$'               

 
.CODE
  
     MOV AX, @DATA               
     MOV DS, AX     
     
     
     LEA DX,INTRO                
     MOV AH,9
     INT 21H
     
     LEA DX,INTRO2               
     MOV AH,9
     INT 21H      
          
     LEA DX,NL                   
     MOV AH,9
     INT 21H       

     JMP BEGINTOP                 

 ERROR121:  
                  
     LEA DX,ER_MSG              
     MOV AH,9
     INT 21H 
                                 
     LEA DX,ERASK
     MOV AH,9
     INT 21H
                

 BEGINTOP:   
 
     LEA DX,NL                  
     MOV AH,9
     INT 21H
    
                                 
     MOV BL,10                 
     MOV AH,9 
     MOV AL,0  
     INT 10H                
      
     LEA DX,INFO                 
     MOV AH,9 
     INT 21H                     
     
     MOV BL,11                  
     MOV AH,9 
     MOV AL,0  
     INT 10H   
   
        

     LEA DX,CS_MALE              
     MOV AH,9
     INT 21H 
     
     LEA DX,NL                  
     MOV AH,9
     INT 21H

                  
     LEA DX,FS_MALE              
     MOV AH,9
     INT 21H  
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
                   
     LEA DX,PANT_MALE            
     MOV AH,9
     INT 21H    
     
     LEA DX,NL                  
     MOV AH,9
     INT 21H
     
                   
     LEA DX,M_SHOES             
     MOV AH,9
     INT 21H   
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
                   
     LEA DX,CS_FEMALE            
     MOV AH,9
     INT 21H  
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
                   
     LEA DX,PANT_FEMALE          
     MOV AH,9
     INT 21H 
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
     LEA DX,F_SHOES              
     MOV AH,9
     INT 21H    
     
     LEA DX,NL                 
     MOV AH,9
     INT 21H
     
      
     LEA DX,PANJABI             
     MOV AH,9       
     INT 21H    
     
     LEA DX,NL                   
     MOV AH,9
     INT 21H
     
      
     LEA DX,KURTI                
     MOV AH,9       
     INT 21H    
     
     LEA DX,NL                  
     MOV AH,9
     INT 21H
            
     LEA DX,ENTER              
     MOV AH,9       
     INT 21H    
        
     
     MOV AH,1                    
     INT 21H 
     
                                 
     CMP AL,49                  
     JE CS_MALEB
     
     CMP AL,50                  
     JE FS_MALEB
     
     CMP AL,51                   
     JE PANT_MALEB
     
     CMP AL,52                   
     JE M_SHOESB
     
     CMP AL,53                  
     JE CS_FEMALEB
     
     CMP AL,54                   
     JE PANT_FEMALEB
     
     CMP AL,55                 
     JE F_SHOESB
     
     CMP AL,56                   
     JE PANJABIB
     
     CMP AL,57                   
     JE KURTIB
     
    
     
     
     JMP ERROR121                 
     
  
CS_MALEB:
                                 
MOV A,150                        

JMP QUANTITY

FS_MALEB:

MOV A,140                        

JMP QUANTITY 

PANT_MALEB:

MOV A,210                        

JMP QUANTITY 

M_SHOESB: 

MOV A,350                        

JMP QUANTITY 

CS_FEMALEB: 

MOV A,140                       

JMP QUANTITY 

PANT_FEMALEB:

MOV A,220                        

JMP QUANTITY 

F_SHOESB:   

MOV A,310                        

JMP QUANTITY 

PANJABIB:   

MOV A,180                        

JMP QUANTITY 

KURTIB:      

MOV A,225                        

JMP QUANTITY 

   

QUANTITY:  

    MOV BL,6 
    MOV AH,9                     
    MOV AL,0  
    INT 10H

    LEA DX,E_QUANTITY           
    MOV AH,9
    INT 21H 
    
    JMP MULTI           


ASK: 

    MOV BL,1                     
    MOV AH,9 
    MOV AL,0  
    INT 10H
    
    LEA DX,AGAIN                 
    MOV AH,9
    INT 21H 
    
    MOV AH,1                     
    INT 21H
    
    CMP AL,49                    
    JE BEGINTOP
    
    CMP AL,50
    JE OUTPUT2                   
    
    LEA DX,ER_MSG
    MOV AH,9                    
    INT 21H
    
    JMP ASK                      
    


ERROR:
    
    LEA DX,ER_MSG                
    MOV AH,9
    INT 21H
    
    JMP QUANTITY               
    
ER_DISCOUNT:   

    LEA DX,ER_MSG               
    MOV AH,9
    INT 21H
    
    LEA DX,NL                
    MOV AH,9
    INT 21H
    
    LEA DX,EN_DIS               
    MOV AH,9
    INT 21H
    
    JMP INPUT_SUB                
    
    
MULTI:         

    MOV BL,4                      
    MOV AH,9 
    MOV AL,0  
    INT 10H    

INDEC3 PROC                        
    
    PUSH BX                        
    PUSH CX
    PUSH DX

    
    
    XOR BX,BX                       
    
    XOR CX,CX                    
                    
    
    MOV AH,1                       
    INT 21H


    
    REPEAT4: 
                                     
    CMP AL,48                     
    JL ERROR
    
    CMP AL,57                       
    JG ERROR


    AND AX,00FH                    
    PUSH AX                        
    
    MOV AX,10                      
    MUL BX                         
    POP BX                          
    ADD BX,AX                       
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,0DH                      
    JNE REPEAT4                     
    
    MOV AX,BX                       
    
    
    JMP MUL_
    
    POP DX                          
    POP CX
    POP BX
    RET                            
    
    

INDEC3 ENDP                         

ADD_: 


   
    MOV B,AX  
    
    MOV BL,4                        
    MOV AH,9 
    MOV AL,0  
    INT 10H 
    
    
    XOR AX,AX                       
    
    MOV AX,B                         
    ADD A,AX                         
    
    
    MOV AX,A                         
    
    PUSH AX                          
    
    
    JMP END

SUB_: 


    
    MOV B,AX 
    
    LEA DX,R                         
    MOV AH,9
    INT 21H
    
    
    XOR AX,AX                       
    
    MOV AX,B                        
    SUB A,AX                         
    
    
    MOV AX,A                         
    
    PUSH AX  
    
    ADD S,AX
    
    JMP OUTPUT

MUL_: 


   
    MOV B,AX             
    
    MOV BL,4
    MOV AH,9                         
    MOV AL,0  
    INT 10H 
    
    LEA DX,E_DISCOUNT                
    MOV AH,9
    INT 21H
    
    XOR AX,AX                       
    
    MOV AX,B
    
    MUL A                            
    
    
    PUSH AX                         
    
    MOV A,AX 
   
                                     
    JMP INPUT_SUB                    
    
    
    
    JMP OUTPUT 
                                          
INPUT_ADD: 

INDEC1 PROC                           
    
    PUSH BX                          
    PUSH CX
    PUSH DX
    
        
    BEGIN1:
    
    
    XOR BX,BX                        
    
    XOR CX,CX                       
                    
    
    MOV AH,1                         
    INT 21H

    
    REPEAT2: 
                                     
    CMP AL,48
    JL ERROR
    
    CMP AL,57                        
    JG ERROR


    AND AX,00FH                      
    PUSH AX                         
    
    MOV AX,10                       
    MUL BX                           
    POP BX                           
    ADD BX,AX                        
    
    
    MOV AH,1                       
    INT 21H
    
    CMP AL,0DH                       
    JNE REPEAT2                      
    
    MOV AX,BX                       
                         
    
    JMP ADD_                         
    
    POP DX                           
    POP CX
    POP BX
    RET                             
    
    

INDEC1 ENDP   

INPUT_SUB: 

INDEC2 PROC
    
    PUSH BX                         
    PUSH CX
    PUSH DX
    
    
    
    XOR BX,BX                       
    
    XOR CX,CX                       
                    

    MOV AH,1                         
    INT 21H
    
    
    
    REPEAT3: 
    
    CMP AL,48                         
    JL ER_DISCOUNT
    
    CMP AL,57                        
    JG ER_DISCOUNT


    AND AX,00FH                      
    PUSH AX                         
    
    MOV AX,10                        
    MUL BX                          
    POP BX                          
    ADD BX,AX                        
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,0DH                     
    JNE REPEAT3                      
    
    MOV AX,BX                       
    
    OR CX,CX                         
    
    
    JMP SUB_

    POP DX                           
    POP CX
    POP BX
    RET                            
                            


INDEC2 ENDP 
    
OUTPUT:         



OUTDEC PROC
    
    
    PUSH AX                         
    PUSH BX
    PUSH CX
    PUSH DX
    
    XOR CX,CX                        
    MOV BX,10D                       
    
    REPEAT1:
    
    XOR DX,DX                        
    DIV BX                           
    
    PUSH DX                        
    INC CX                          
    
    OR AX,AX                        
    JNE REPEAT1                     
    
    MOV AH,2                       
    
    PRINT_LOOP:
    
    POP DX                          
    OR DL,30H                       
    INT 21H                          
    LOOP PRINT_LOOP                 
    
    POP DX
    POP CX                          
    POP BX
    POP AX 
    
    JMP ASK
    
    RET
    OUTDEC ENDP 

OUTPUT2: 

    LEA DX,FT                        
    MOV AH,9
    INT 21H
    
    XOR AX,AX                        
    
    MOV AX,S                        
    
    
    
    
                                     
OUTDEC2 PROC
    
    
    PUSH AX                          
    PUSH BX
    PUSH CX
    PUSH DX

    XOR CX,CX                        
    MOV BX,10D                       
    
    REPEAT12:
    
    XOR DX,DX                        
    DIV BX                          
    
    PUSH DX                          
    INC CX                           
    
    OR AX,AX                         
    JNE REPEAT12                    
    
    MOV AH,2                        
    
    PRINT_LOOP2:
    
    POP DX                           
    OR DL,30H                        
    INT 21H                         
    LOOP PRINT_LOOP2                
    
    POP DX
    POP CX                          
    POP BX
    POP AX 
    

    OUTDEC2 ENDP 
 

     
END:
MOV AH, 4CH                  
INT 21H