echo "Create an account(eosio.token) to deploy the contract"

pbkey="$(grep "Public" userkeys | awk '{print $3}')"

cleos create account eosio survey "$pbkey" "$pbkey"

echo "Build contracts"

cd ../contract

#eosio-cpp survey.cpp -o survey.wasm
#eosio-abigen survey.cpp --output=survey.abi
#eosio-wasm2wast survey.wasm > survey.wast

cd ../scripts

echo "Deploy contract"

cleos set contract survey contracts/survey -p survey@active