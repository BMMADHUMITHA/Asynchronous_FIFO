# Asynchronous_FIFO
<img width="421" alt="image" src="https://github.com/BMMADHUMITHA/Asynchronous_FIFO/assets/134037700/598be7f5-c445-4e94-ac12-9e924f812cf3">
Asynchronous FIFO (First-In-First-Out) designs are used over synchronous FIFOs in certain situations due to their ability to handle data transfers between different clock domains, where the two clocks operate at different frequencies or are not synchronized.
FIFO FULL & EMPTY CONDITION
<img width="460" alt="image" src="https://github.com/BMMADHUMITHA/Asynchronous_FIFO/assets/134037700/4e7858b4-504c-41ab-927a-d7b08ac1f915">
The write pointer always points to the next word to be written; therefore, on reset, both pointers are set to zero, which also happens to be the next FIFO word location to be written.
The read pointer always points to the current FIFO word to be read. The read pointer is always pointing to the next FIFO word to be read means that the receiver logic does
not have to use two clock periods to read the data word. To determine full and empty status for an asynchronous FIFO design, the write and read pointers will have to be
compared. The FIFO will go full when the write pointer catches up to the synchronized read pointer in the write clock domain. When (waddr[3:0] == raddr[3:0]) the FIFO is either FULL or EMPTY FIFO is FULL if ({~waddr[4],waddr[3:0]} == raddr) i.e. when the write pointer has caught up with the read pointer.
FIFO is EMPTY if (waddr == raddr) i.e. when the write pointer is equal to the read pointer
Using n-bit pointers where (n-1) is the number of address bits required to access the entire FIFO memory buffer, the FIFO is empty when both pointers, including the MSBs are
equal. Similarly, the FIFO is full when both pointers, except the MSBs are equal.
GRAY CODE OVER BINARYCODE
Gray code is often used in asynchronous FIFO designs because it helps address synchronization issues between different clock domains more effectively than binary code.

# Verilog Simulation Results
<img width="473" alt="image" src="https://github.com/BMMADHUMITHA/Asynchronous_FIFO/assets/134037700/6c5d635c-3460-455a-9c3a-994c99eeaa8a">

# UVM testbenches
<img width="376" alt="image" src="https://github.com/BMMADHUMITHA/Asynchronous_FIFO/assets/134037700/60de6fd7-49c7-43ed-9fc5-e5e141e602b5">
# UVM simulation output 
<img width="478" alt="image" src="https://github.com/BMMADHUMITHA/Asynchronous_FIFO/assets/134037700/d34e5c20-3f51-45e2-a9ef-759f1b23a313">
<img width="542" alt="image" src="https://github.com/BMMADHUMITHA/Asynchronous_FIFO/assets/134037700/c9f0f206-aa14-4ca7-aea1-1ae883683c32">



# References
Simulation and Synthesis Techniques for Asynchronous FIFO Design
Clifford E. Cummings, Sunburst Design, Inc.

# PREPARED BY:
B M Madhumitha, Arpita Jena, Arunima Tripathi, Ashna Mittal, Astha Varshney



