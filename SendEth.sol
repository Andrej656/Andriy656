//SPDX-License-Identifier: GPU 3.0
pragma solidity^0.8.12;

//3 ways to send ETH
//transfer - 2300 gas, reverts
//send - 2300 gas, returns bool
//call - all gas returns bool and data

contract SendEther {
          
         constructor () payable {}
         receive () external payable {}

         function sendViaTransfer (address payable _to) external payable {
                  _to.transfer(1000);

         }
         function sendViaSend (address payable _to) external payable{
                  bool sent = _to.send (1000);
                  require(sent, "send failed");
         }
         function sendViaCall (address payable _to) external payable {
                 (bool success,) = _to.call {value: 1000}("");
                 require (success, "call failed");
           }       
         }
         contract  EthReceiver {
             event Log (uint amount, uint gas);
          receive () external payable {
              emit Log(msg.value, gasleft());
          }  

         }

