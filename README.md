# MLIR Hello Dialect

This is the minimal example to look into the way to implement the hello-world kind of program with MLIR. The basic code structure is borrowed from [standalone](https://github.com/llvm/llvm-project/tree/main/mlir/examples/standalone) and [Toy language](https://github.com/llvm/llvm-project/tree/main/mlir/examples/toy) in LLVM project.


## Image

This is the fork of the [milr-hello](https://github.com/Lewuathe/mlir-hello).
This uses LLVM/MLIR installed by apt-get, instead of ones built from source code.

```bash
# use image in GHCR
# WARNING: image size is large! (over 2GB)
$ docker run -it --rm ghcr.io/syuparn/mlir-hello:main bash
root@032a4b2bb9d6:/mlir-hello# ./build/bin/hello-opt ./test/Hello/print.mlir > print.ll
root@032a4b2bb9d6:/mlir-hello# /lib/llvm-18/bin/lli print.ll
1.000000 2.000000 3.000000 
4.000000 5.000000 6.000000

# or build locally
$ docker build . -t hello-mlir:latest
$ docker run -it --rm hello-mlir:latest bash
root@364092bad1ee:/mlir-hello# ./build/bin/hello-opt ./test/Hello/print.mlir > print.ll
root@364092bad1ee:/mlir-hello# /lib/llvm-18/bin/lli print.ll
1.000000 2.000000 3.000000 
4.000000 5.000000 6.000000
```

## Prerequisites

* [LLVM](https://llvm.org/)
* [MLIR](https://mlir.llvm.org/)
* [CMake](https://cmake.org/)
* [Ninja](https://ninja-build.org/)

We need to build our own MLIR in the local machine in advance. Please follow the build instruction for MLIR [here](https://mlir.llvm.org/getting_started/). 

## Building

Please make sure to build LLVM project first according to [the instruction](https://mlir.llvm.org/getting_started/).

```sh
mkdir build && cd build
cmake -G Ninja .. -DLLVM_DIR=/path/to/llvm-project/build/lib/cmake/llvm \
  -DMLIR_DIR=/path/to/llvm-project/build/lib/cmake/mlir

cmake --build . --target hello-opt
```

To run the test, `check-hello` target will be usable.

To build the documentation from the TableGen description of the dialect operations, run
```sh
cmake --build . --target mlir-doc
```

## Execution

`hello-opt` will lower the MLIR into the bytecode of LLVM. 

```
# Lower MLIR to LLVM IR
$ ./build/bin/hello-opt ./test/Hello/print.mlir > /path/to/print.ll

# Execute the code with LLVM interpreter
$ lli /path/to/print.ll 

1.000000 2.000000 3.000000
4.000000 5.000000 6.000000
```

## Operations

<!-- Autogenerated by mlir-tblgen; don't manually edit -->
### `hello.constant` (::hello::ConstantOp)

constant

Constant operation turns a literal into an SSA value. The data is attached
to the operation as an attribute. For example:

```mlir
  %0 = "hello.constant"()
  { value = dense<[[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]> : tensor<2x3xf64> }
  : () -> tensor<2x3xf64>
```

Traits: AlwaysSpeculatableImplTrait

Interfaces: ConditionallySpeculatable, NoMemoryEffect (MemoryEffectOpInterface)

Effects: MemoryEffects::Effect{}

#### Attributes:

| Attribute | MLIR Type | Description |
| :-------: | :-------: | ----------- |
| `value` | ::mlir::DenseElementsAttr | 64-bit float elements attribute

#### Results:

| Result | Description |
| :----: | ----------- |
&laquo;unnamed&raquo; | tensor of 64-bit float values

### `hello.print` (::hello::PrintOp)

print operation


Syntax:

```
operation ::= `hello.print` $input attr-dict `:` type($input)
```

The "print" builtin operation prints a given input tensor, and produces
no results.

Traits: AlwaysSpeculatableImplTrait

Interfaces: ConditionallySpeculatable, NoMemoryEffect (MemoryEffectOpInterface)

Effects: MemoryEffects::Effect{}

#### Operands:

| Operand | Description |
| :-----: | ----------- |
| `input` | tensor of 64-bit float values or memref of 64-bit float values

### `hello.world` (::hello::WorldOp)

print Hello, World

The "world" operation prints "Hello, World", and produces
no results.

Traits: AlwaysSpeculatableImplTrait

Interfaces: ConditionallySpeculatable, NoMemoryEffect (MemoryEffectOpInterface)

Effects: MemoryEffects::Effect{}

