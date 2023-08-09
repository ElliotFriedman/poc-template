pragma solidity 0.8.19;

/// @notice a standard interface for implementing a proof
/// of concept that exploits a DeFi or smart contract system for profit.
/// can be used to help triagers understand the legitimacy of an exploit.
/// by clearing separating out the different actions that happen during
/// an exploit.
interface IPoC {
    struct TokenAmounts {
        address token;
        int256 amount;
    }
    
    /// @notice step one, fund the contract with different tokens and amounts
    function fund(TokenAmounts[] calldata amounts) external;

    /// @notice step two, snapshot the balance of the attacker, records balance
    /// of all tokens tracked pre-attack
    /// No vm.deal or token mintings allowed in this step
    /// @param tokens the list of tokens to snapshot the balance of
    function snapshotBalancePre(address[] calldata tokens) external;

    /// @notice step three, attack the contract, perform all necessary attack steps
    /// No vm.deal or token mintings allowed in this step, only steps to perform the attack
    function attack() external;

    /// @notice returns the profit and losses from the attack
    function profit() external view returns (TokenAmounts[] memory);

    /// @notice prints the profit from the attack
    function prettyPrintProfit() external;
}
