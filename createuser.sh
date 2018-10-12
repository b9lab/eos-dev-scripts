echo "Create default wallet and store the master password"

cleos wallet create --to-console >> defaultmaster

echo "Check if default wallet is created:"

cleos wallet list

echo "Load default private key"

cleos wallet import --private-key 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3

echo "Set default system contract, eosio.bios"

cleos set contract eosio contracts/eosio.bios -p eosio@active # sign with active authority of the eosio
# active authority is used for transferring funds, voting for producers and making other high-level account changes.

echo "Create an user..."

echo "Create a key pair for the 'user'"

cleos create key --to-console >> userkeys

echo "Import the key into wallet"

pvkey="$(grep "Private" userkeys | awk '{print $3}')"

cleos wallet import --private-key "$pvkey"

echo "Create the account 'user'"

pbkey="$(grep "Public" userkeys | awk '{print $3}')"

cleos create account eosio user "$pbkey" "$pbkey"

echo "Use same key to create 'tester'"

cleos create account eosio tester "$pbkey" "$pbkey"

echo "Check if accounts using "
echo $pbkey 
echo "are created:"

cleos get accounts "$pbkey"