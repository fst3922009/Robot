*** Settings ***
Documentation    Robot Framework Booktest
Library  SeleniumLibrary


*** Variables ***
${browser}     chrome
${url}     https://www.books.com.tw/web/books_topm_01/?loc=P_0005_001
${Title}    文學小說
${Book Title}    大人的謊言生活：【文學界備受推崇的覆面系作家，義大利文直譯中文版】
*** Test Cases ***
Google News
    GO TO Books
    Check Title
    Click Bookname Button  
    Check Book Title
*** Keywords ***
GO TO Books
    Open Browser    ${url}      ${browser}
    
Check Title
    Element Text Should Be    //*[@id="index-page"]/body/div[4]/div[2]/div[2]/ul/li/span/a    ${Title} 

Click Bookname Button   
    Click Element     //*[@id="index-page"]/body/div[4]/div[1]/div[4]/div[1]/div/div[1]/div[1]/h4/a
    Wait Until Element Is Visible    //*[@id="0010939127-page"]/body/div[5]/div/div[1]/div[3]/ul/li[1]/a
    
Check Book Title
    Element Text Should Be    //*[@id="0010939127-page"]/body/div[4]/div/div[1]/div[2]/div[1]/h1    ${Book Title} 
    Close Browser
