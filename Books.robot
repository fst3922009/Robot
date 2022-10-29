*** Settings ***
Documentation    Robot Framework Booktest
Library  SeleniumLibrary


*** Variables ***
${browser}     chrome
${url}     https://www.books.com.tw/web/books_topm_01/?loc=P_0005_001
${Title}    文學小說
${Book Name}    大人的謊言生活：【文學界備受推崇的覆面系作家，義大利文直譯中文版】
${author}     艾琳娜‧斐蘭德
${Publishing House}    大塊文化
*** Test Cases ***
Google News
    GO TO Books
    Verify Link Title
    Click Bookname Button  
    Verify Book Name
    Verify Book author
    Verify Book Publishing House 
*** Keywords ***
GO TO Books
    Open Browser    ${url}      ${browser}
    
Verify Link Title
    Element Text Should Be    //*[@id="index-page"]/body/div[4]/div[2]/div[2]/ul/li/span/a    ${Title} 

Click Bookname Button   
    Click Element     //*[@id="index-page"]/body/div[4]/div[1]/div[4]/div[1]/div/div[1]/div[1]/h4/a
    Wait Until Element Is Visible    //*[@id="0010939127-page"]/body/div[5]/div/div[1]/div[3]/ul/li[1]/a
    
Verify Book Name
    Element Text Should Be    //*[@id="0010939127-page"]/body/div[4]/div/div[1]/div[2]/div[1]/h1    ${Book Name} 
    
Verify Book author
    Element Text Should Be    //*[@id="0010939127-page"]/body/div[4]/div/div[1]/div[2]/div[3]/ul/li[1]/a[1]    ${author}
    
Verify Book Publishing House    
    Element Text Should Be    //*[@id="0010939127-page"]/body/div[4]/div/div[1]/div[2]/div[3]/ul/li[4]/a[1]/span    ${Publishing House}
    Close Browser
