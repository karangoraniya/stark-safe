// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts for Cairo ^0.14.0

#[starknet::contract]
mod StarSafe {

    use starknet::get_caller_address;
    use starknet::ContractAddress;



    #[storage]
    struct Storage {
        owner: ContractAddress,
        whitelist: LegacyMap::<ContractAddress, bool>,
        withdrawal_limits: LegacyMap::<ContractAddress, u256>,
        last_withdrawal: LegacyMap::<ContractAddress, u64>,
        balances: LegacyMap::<(ContractAddress, ContractAddress), u256>, // (user, token) -> balance
    }

    #[event]
    fn Deposit(user: ContractAddress, token: ContractAddress, amount: u256) {}

    #[event]
    fn Withdrawal(user: ContractAddress, token: ContractAddress, amount: u256) {}

}