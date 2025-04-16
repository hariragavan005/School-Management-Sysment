/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author subha
 */
 
    import java.util.concurrent.atomic.AtomicInteger;

class DonationThread extends Thread {
    private int start;
    private int end;
    private int[] salaries;
    private AtomicInteger totalDonation;

    public DonationThread(int start, int end, int[] salaries, AtomicInteger totalDonation) {
        this.start = start;
        this.end = end;
        this.salaries = salaries;
        this.totalDonation = totalDonation;
    }

    @Override
    public void run() {
        int localTotal = 0;
        for (int i = start; i < end; i++) {
            localTotal += salaries[i] / 30; // One day salary
        }
        totalDonation.addAndGet(localTotal); // Update shared total
    }
}

public class multhithreading {
    public static void main(String[] args) {
        int totalStaff = 1000;
        int[] salaries = new int[totalStaff];
        AtomicInteger totalDonation = new AtomicInteger(0);

        // Generate random salaries between 30,000 and 50,000
        for (int i = 0; i < totalStaff; i++) {
            salaries[i] = 30000 + (int) (Math.random() * 20001);
        }

        // Divide work among threads
        int numberOfThreads = 5;
        int staffPerThread = totalStaff / numberOfThreads;
        Thread[] threads = new Thread[numberOfThreads];

        for (int i = 0; i < numberOfThreads; i++) {
            int start = i * staffPerThread;
            int end = (i == numberOfThreads - 1) ? totalStaff : start + staffPerThread;
            threads[i] = new DonationThread(start, end, salaries, totalDonation);
            threads[i].start();
        }

        // Wait for all threads to finish
        for (Thread thread : threads) {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        // Print the total donation
        System.out.println("Total Charity Amount: " + totalDonation.get());
    }
}

    

