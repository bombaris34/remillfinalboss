/*
 * Copyright (c) 2017 Trail of Bits, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/* MOVMSKPD r32, xmm: extract sign bits (bit 63) of 2 packed doubles
 * into the low 2 bits of r32. Each TEST_INPUTS pair is (low 64 bits,
 * high 64 bits) of the XMM register, i.e. [double0] and [double1]. */

TEST_BEGIN_64(MOVMSKPDr32xmm_0, 2)
TEST_INPUTS(
    0, 0,
    0x8000000000000000, 0,
    0, 0x8000000000000000,
    0x8000000000000000, 0x8000000000000000,
    0xFFFFFFFFFFFFFFFF, 0xFFFFFFFFFFFFFFFF,
    0x3FF0000000000000, 0xBFF0000000000000)

    sub rsp, 16
    mov [rsp], ARG1_64
    mov [rsp+8], ARG2_64
    movapd xmm0, [rsp]
    movmskpd eax, xmm0
    add rsp, 16
TEST_END_64

TEST_BEGIN_64(MOVMSKPDr32xmm_4, 2)
TEST_INPUTS(
    0, 0,
    0x8000000000000000, 0x8000000000000000)

    sub rsp, 16
    mov [rsp], ARG1_64
    mov [rsp+8], ARG2_64
    movapd xmm4, [rsp]
    movmskpd eax, xmm4
    add rsp, 16
TEST_END_64
